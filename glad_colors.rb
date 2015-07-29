def glad_colors(string, color_code)
  "\e[#{color_code}m#{string}\e[0m"
end

# Changes string to Blue
def pink(string)
  glad_colors(string, 35)
end

# Changes string to Blue
def blue(string)
  colorize(string, 36)
end