{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "youtube-downloader";

  # Use a dummy source directory
  src = ./dummy;  # The dummy directory we just created

  buildInputs = [ pkgs.yt-dlp ];

  installPhase = ''
    mkdir -p $out/bin
    cat > $out/bin/youtube-downloader <<EOF
#!/usr/bin/env zsh

# Script to download video or audio from YouTube

read "media_type?audio(0) or video(1): "
read "url?url: "
read "name?media name: "
read "check?Is everything good? (y/n): "

if [ "\$media_type" = "0" ]; then
  echo "Downloading audio ..."
  yt-dlp --extract-audio --audio-format mp3 "\$url" -P ~/Music -o "\$name.%(ext)s"
elif [ "\$media_type" = "1" ]; then
  echo "Downloading video ..."
  yt-dlp "\$url" -P ~/Videos -o "\$name.%(ext)s"
else
  echo "Invalid media type"
fi
EOF
    chmod +x $out/bin/youtube-downloader
  '';
}

