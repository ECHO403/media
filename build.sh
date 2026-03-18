#!/bin/bash
# Set the following shell variable:
FFMPEG_MODULE_PATH="$(pwd)/libraries/decoder_ffmpeg/src/main"
# Download the Android NDK 
# NDK_PATH=/Users/su/Library/Android/sdk/ndk/28.1.13356709
NDK_PATH=/Users/su/Library/Android/sdk/ndk/27.0.12077973
# Set the host platform (use "darwin-x86_64" for Mac OS X):
HOST_PLATFORM="darwin-x86_64"
# Set the ABI version for native code (typically it's equal to minSdk and must not exceed it):
ANDROID_ABI=21
# Fetch FFmpeg
FFMPEG_PATH="$(pwd)/../ffmpeg"
# Configure the decoders to include.
ENABLED_DECODERS=(vorbis opus flac aac mp3 vorbis opus alac)
# Add a link to the FFmpeg source code in the FFmpeg module jni directory.
cd "${FFMPEG_MODULE_PATH}/jni" && \
ln -s "$FFMPEG_PATH" ffmpeg
# Execute build_ffmpeg.sh to build FFmpeg for armeabi-v7a, arm64-v8a, x86 and x86_64. The script can be edited if you need to build for different architectures:
cd "${FFMPEG_MODULE_PATH}/jni" && \
./build_ffmpeg.sh \
  "${FFMPEG_MODULE_PATH}" "${NDK_PATH}" "${HOST_PLATFORM}" "${ANDROID_ABI}" "${ENABLED_DECODERS[@]}"
