class TalksReducer < Formula
  include Language::Python::Virtualenv

  desc "Remove silent parts from video recordings"
  homepage "https://github.com/popstas/talks-reducer"
  url "https://github.com/popstas/talks-reducer/archive/refs/tags/v0.10.1.tar.gz"
  sha256 "8a7a4a79947fee65130a39757f50e731d61d081687566c7ae4c33d24f5c38910"
  license "MIT"

  depends_on "python@3.11"
  depends_on "ffmpeg"

  def install
    venv = virtualenv_create(libexec, "python3.11")
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/talks-reducer --version")
  end
end
