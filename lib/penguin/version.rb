module Penguin
  module VERSION
    MAJOR = 0
    MINOR = 0
    PATCH = 1
    PRE   = "beta1"

    STRING = [MAJOR, MINOR, PATCH, PRE].compact.join(".")
  end
end
