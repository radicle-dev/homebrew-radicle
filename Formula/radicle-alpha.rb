class RadicleAlpha < Formula
  desc "Peer-to-peer stack for code collaboration"
  homepage "http://radicle.xyz"
  url "http://storage.googleapis.com/static.radicle.xyz/releases/radicle_2019.03.01-a322dfb_x86_64-darwin.tar.gz"
  version "0.1.0"
  sha256 "3cbd5ae9d83dde38dbf331530ed722f55ed8a52d098b576975f61dc887f95d0b"
  head "https://github.com/oscoin/radicle"

  depends_on "ipfs"

  def install
    bin.install Dir.glob("bin/*")
    lib.install "lib/radicle"
    share.install "share/doc"
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
