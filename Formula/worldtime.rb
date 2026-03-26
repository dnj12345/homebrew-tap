# worldtime.rb
#
# Homebrew formula for https://github.com/dnj12345/worldtime
#
# Installation:
#   brew tap dnj12345/tap
#   brew install worldtime

class Worldtime < Formula
  desc "Print local time for any city in the world"
  homepage "https://github.com/dnj12345/worldtime"
  url "https://github.com/dnj12345/worldtime/archive/refs/tags/release-1.1.0.tar.gz"
  version "1.1.0"
  sha256 "470eaaa4a4aa050f9e419bf8733ad6343c22acd5d6a7b10692f74eebfcaab7e4"

  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build",
      "-buildvcs=false",
      "-trimpath",
      "-ldflags", "-s -w",
      "-o", bin/"worldtime",
      "."
  end

  test do
    output = shell_output("#{bin}/worldtime London")
    assert_match(/\w{3} \w{3}\s+\d+ \d{2}:\d{2}:\d{2}/, output)
  end
end
