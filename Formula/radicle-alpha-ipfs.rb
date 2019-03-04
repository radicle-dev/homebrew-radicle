class RadicleAlphaIpfs < Formula
  desc "Radicle IPFS backend"
  homepage "http://radicle.xyz"
  url "http://storage.googleapis.com/static.radicle.xyz/releases/radicle_2019.03.04-d21900b_x86_64-darwin.tar.gz"
  version "0.1.0"
  sha256 "f7d9778a4b018d3ad570fbf111fc80a3ad6791da8f00cca5c5d9323037693b51"
  head "https://github.com/oscoin/radicle"

  depends_on "ipfs"

  def install
    bin.install Dir.glob("bin/*")
    lib.install "local/lib/radicle"
    share.install "share/doc"
  end

  plist_options :manual => "#{HOMEBREW_PREFIX}/rad daemon-ipfs"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>KeepAlive</key>
      <dict>
        <key>OtherJobEnabled</key>
        <string>homebrew.mxcl.radicle-alpha.plist</string>
      </dict>

      <key>Label</key>
      <string>#{plist_name}</string>

      <key>EnvironmentVariables</key>
      <dict>
        <key>PATH</key>
        <string><![CDATA[/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin]]></string>
      </dict>

      <key>ProgramArguments</key>
      <array>
        <string>#{bin}/rad</string>
        <string>daemon-ipfs</string>
      </array>

      <key>RunAtLoad</key>
      <true/>

      <key>WorkingDirectory</key>
      <string>#{HOMEBREW_PREFIX}</string>

      <key>StandardOutPath</key>
      <string>#{var}/log/radicle-ipfs.log</string>

      <key>StandardErrorPath</key>
      <string>#{var}/log/radicle-ipfs.log</string>
    </dict>
    </plist>
  EOS
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test radicle-alpha`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
