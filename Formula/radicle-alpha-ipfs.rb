class RadicleAlphaIpfs < Formula
  @@version = "2019.03.12-9ad916d"
  desc "Radicle IPFS backend"
  homepage "http://radicle.xyz"
  url "http://storage.googleapis.com/static.radicle.xyz/releases/radicle_#{@@version}_x86_64-darwin.tar.gz"
  version "0.1.0-#{@@version}"
  sha256 "c92b7f8f35cc8c230372ba3c6b458ce3335302fdae2e1d241a4adbfee0240716"
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
