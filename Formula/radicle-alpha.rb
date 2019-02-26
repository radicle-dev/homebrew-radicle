class RadicleAlpha < Formula
  desc "Peer-to-peer stack for code collaboration"
  homepage "http://radicle.xyz"
  url "http://storage.googleapis.com/static.radicle.xyz/releases/radicle_d166d071f3a9e572998a89e28df03dd7100df879_x86_64-darwin.tar.gz"
  version "0.1.0"
  sha256 "4ef62f13f5a0795835f7fe67c6ea85bb8b0b01c0a9c4b74f898d3d25e8113d41"
  head "https://github.com/oscoin/radicle"

  depends_on "ipfs"

  def install
    bin.install Dir.glob("local/bin/rad*").concat(Dir.glob("local/bin/git*"))
    doc.install Dir.glob("local/share/doc/radicle/*")
    share.install "local/share/radicle"
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
