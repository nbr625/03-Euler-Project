# scanf for Ruby, v.1.1.1
#
# February 19, 2003
#
# A product of the Austin Ruby Codefest (Austin, Texas, August 2002)
#
# Copyright (c) 2002-2003, David Alan Black
# Released under the same licensing terms as Ruby itself.
#
# See README for information on usage and details of license.
#
#

module Scanf

  class FormatSpecifier

    attr_reader :re_string, :matched_string, :conversion
    attr_writer :i

    private

    def skip;  /^\s*%\*/.match(@spec_string); end

    def extract_float(s); s.to_f if s &&! skip; end
    def extract_decimal(s); s.to_i if s &&! skip; end
    def extract_hex(s); s.hex if s &&! skip; end
    def extract_octal(s); s.oct if s &&! skip; end
    def extract_integer(s); Integer(s) if s &&! skip; end
    def extract_plain(s); s unless skip; end

    def nil_proc(s); nil; end

    public

    def to_s
      @spec_string
    end

    def count_space?
      /(?:\A|\S)%\*?\d*c|\[/.match(@spec_string)
    end

    def initialize(str)
      @spec_string = str

      h = '[A-Fa-f0-9]'

      @re_string, @handler = 
	case @spec_string

	  # %[[:...:]]
	when /%\*?(\[\[:[a-z]+:\]\])/
	  [ "(#{$1}+)", :extract_plain ]

	  # %5[[:...:]]
	when /%\*?(\d+)(\[\[:[a-z]+:\]\])/
	  [ "(#{$2}{1,#{$1}})", :extract_plain ]

	  # %[...]
	when /%\*?\[([^\]]*)\]/
	  yes = $1
	  if /^\^/.match(yes) then no = yes[1..-1] else no = '^' + yes end
	  [ "([#{yes}]+)(?=[#{no}]|\\z)", :extract_plain ]

	  # %5[...]
	when /%\*?(\d+)\[([^\]]*)\]/
	  yes = $2
	  w = $1
	  [ "([#{yes}]{1,#{w}})", :extract_plain ]

	  # %i
	when /%\*?i/
	  [ "([-+]?(?:(?:0[0-7]+)|(?:0[Xx]#{h}+)|(?:[1-9]\\d+)))", :extract_integer ]

	  # %5i
	when /%\*?(\d+)i/
	  n = $1.to_i
	  s = "("
	  if n > 1 then s += "[1-9]\\d{1,#{n-1}}|" end
	  if n > 1 then s += "0[0-7]{1,#{n-1}}|" end
	  if n > 2 then s += "[-+]0[0-7]{1,#{n-2}}|" end
	  if n > 2 then s += "[-+][1-9]\\d{1,#{n-2}}|" end
	  if n > 2 then s += "0[Xx]#{h}{1,#{n-2}}|" end
	  if n > 3 then s += "[-+]0[Xx]#{h}{1,#{n-3}}|" end
	  s += "\\d"
	  s += ")"
	  [ s, :extract_integer ]

	  # %d, %u
	when /%\*?[du]/
	  [ '([-+]?\d+)', :extract_decimal ]

	  # %5d, %5u
	when /%\*?(\d+)[du]/
	  n = $1.to_i
	  s = "("
	  if n > 1 then s += "[-+]\\d{1,#{n-1}}|" end
	  s += "\\d{1,#{$1}})"
	  [ s, :extract_decimal ]

	  # %x
	when /%\*?[Xx]/
	  [ "([-+]?(?:0[Xx])?#{h}+)", :extract_hex ]

	  # %5x
	when /%\*?(\d+)[Xx]/
	  n = $1.to_i
	  s = "("
	  if n > 3 then s += "[-+]0[Xx]#{h}{1,#{n-3}}|" end
	  if n > 2 then s += "0[Xx]#{h}{1,#{n-2}}|" end
	  if n > 1 then s += "[-+]#{h}{1,#{n-1}}|" end
	  s += "#{h}{1,#{n}}"
	  s += ")"
	  [ s, :extract_hex ]

	  # %o
	when /%\*?o/
	  [ '([-+]?[0-7]+)', :extract_octal ]

	  # %5o
	when /%\*?(\d+)o/
	  [ "([-+][0-7]{1,#{$1.to_i-1}}|[0-7]{1,#{$1}})", :extract_octal ]

	  # %f
	when /%\*?f/
	  [ '([-+]?((\d+(?>(?=[^\d.]|$)))|(\d*(\.(\d*([eE][-+]?\d+)?)))))', :extract_float ]

	  # %5f
	when /%\*?(\d+)f/
	  [ "(\\S{1,#{$1}})", :extract_float ]

	  # %5s
	when /%\*?(\d+)s/
	  [ "(\\S{1,#{$1}})", :extract_plain ]

	  # %s
	when /%\*?s/
	  [ '(\S+)', :extract_plain ]

	  # %c
	when /\s%\*?c/
	  [ "\\s*(.)", :extract_plain ]

	  # %c
	when /%\*?c/
	  [ "(.)", :extract_plain ]

	  # %5c (whitespace issues are handled by the count_*_space? methods)
	when /%\*?(\d+)c/
	  [ "(.{1,#{$1}})", :extract_plain ]

	  # %%
	when /%%/
	  [ '(\s*%)', :nil_proc ]

	  # literal characters
	else
	  [ "(#{Regexp.escape(@spec_string)})", :nil_proc ]
	end

      @re_string = '\A' + @re_string
    end

    def to_re
      Regexp.new(@re_string,Regexp::MULTILINE)
    end

    def match(str)
      s = str.dup
      s.sub!(/\A\s+/,'') unless count_space?
      res = to_re.match(s)
      if res
	@conversion = send(@handler, res[1])
	@matched_string = @matched_item.to_s
      end
      res
    end

    def letter
      /%\*?\d*([a-z\[])/.match(@spec_string).to_a[1]
    end

    def width
      w = /%\*?(\d+)/.match(@spec_string).to_a[1]
      w && w.to_i || 0
    end

    def mid_match?
      cc_no_width    =   letter == '[' && width.zero?
      c_or_cc_width  =   (letter == 'c' || letter == '[') &&! width.zero?
      c_or_cc_open   =   c_or_cc_width && (matched_string.size < width)
      
      return c_or_cc_open || cc_no_width
    end
    
  end

  class FormatString

    attr_reader :string_left, :last_spec_tried, :last_match_tried, :matched_count

    SPECIFIERS = 'diuXxofeEgsc'
    REGEX = /
        # possible space, followed by...
          (?:\s*
          # percent sign, followed by...
	    %
	    # another percent sign, or...
	      (?:%|
		 # optional assignment suppression flag
		 \*?
		 # optional maximum field width
		 \d*
		   # named character class, ...
		   (?:\[\[:\w+:\]\]|
		   # traditional character class, or...
		      \[[^\]]*\]|
		   # specifier letter.
		      [#{SPECIFIERS}])))|
	    # or miscellaneous characters
	      [^%\s]+/ix

    def initialize(str)
      @specs = []
      s = str.to_s
      return unless /\S/.match(s)
      @specs.replace s.scan(REGEX).map {|spec| FormatSpecifier.new(spec) }
    end

    def to_s
      @spec_string
    end

    def prune(n=matched_count)
      n.times { @specs.shift }
    end

    def spec_count
      @specs.size
    end

    def last_spec
      @i == spec_count - 1
    end

    def match(str)
      accum = []
      @string_left = str
      @matched_count = 0

      @specs.each_with_index do |spec,@i|
	@last_spec_tried = spec
	@last_match_tried = spec.match(@string_left)
	break unless @last_match_tried
	@matched_count += 1

	accum << spec.conversion

	@string_left = @last_match_tried.post_match
	@string_left.sub!(/\s*\z/,'') if last_spec
	break if @string_left.empty?
      end
      return accum.compact
    end
  end
end

class IO

# The trick here is doing a match where you grab one *line*
# of input at a time.  The linebreak may or may not occur
# at the boundary where the string matches a format specifier.
# And if it does, some rule about whitespace may or may not
# be in effect...

# That's why this is much more elaborate than the string
# version.

# Match succeeds (non-emptily)
# and the last attempted spec/string sub-match succeeded:
#
# is the current matched spec a '[' or 'c' with a width?
#   yes: is current.string.size < available width?
#     yes: save interim results
#     no: width is used up, so move on (next)
#   no: is it a '[' with no width?
#     yes: evidently nothing violated it yet, so store
#          interim results and continue (next)
#
#   (c  means %c)
#   (cc means character class)
#
# The last attempted spec/string did not match:
#
# are we on the next-to-last spec in the string?
#   no: fatal failure
#   yes:
#     is fmt_string.string_left all spaces?
#       yes: does current spec care about input space?
#         yes: fatal failure
#         no: save interim results and continue
#
#
  def scanf(str,&b)
    return block_scanf(str,&b) if b
    return [] unless str.size > 0

    start_position = pos
    matched_so_far = 0
    result_buffer = []
    source_buffer = ""
    final_result = []

    fstr = Scanf::FormatString.new(str)

    loop do
      if eof
	final_result.concat(result_buffer)
	break
      end

      source_buffer << gets
      current_match = fstr.match(source_buffer)

      spec = fstr.last_spec_tried

      if fstr.last_match_tried
	if spec.mid_match?
	  result_buffer.replace(current_match)
	  next
	end
      elsif (fstr.matched_count == fstr.spec_count - 1)
	if /\A\s*\z/.match(fstr.string_left)
	  break if spec.count_space?
	  result_buffer.replace(current_match)
	  next
	end
      end
      
      final_result.concat(current_match)

      matched_so_far += source_buffer.size
      source_buffer.replace(fstr.string_left)
      matched_so_far -= source_buffer.size

      if fstr.last_spec
	soak_up_spaces
	break
      end
      
      fstr.prune
    end
    
    seek(start_position + matched_so_far, IO::SEEK_SET) rescue Errno::ESPIPE
    return final_result
  end

  private

  def soak_up_spaces
    c = getc until eof || /\S/.match(c.to_i.chr)
    ungetc(c) if c
  end

  def block_scanf(str)
    final = []
    begin
      current = scanf(str)
      final.push(yield(current)) unless current.empty?
    end until current.empty? || eof
    return final
  end
end

class String

  def scanf(fstr,&b)
    if b
      block_scanf(fstr,&b)
    else
      fs = 
	if fstr.is_a? Scanf::FormatString
	  fstr 
	else 
	  Scanf::FormatString.new(fstr)
	end
      fs.match(self)
    end
  end

  def block_scanf(fstr,&b)
    fs = Scanf::FormatString.new(fstr)
    str = self.dup
    final = []
    begin
      current = str.scanf(fs)
      final.push(yield(current)) unless current.empty?
      str = fs.string_left
    end until current.empty? || str.empty?
    return final
  end
end

module Kernel
  def scanf(fs)
    STDIN.scanf(fs)
  end
end
