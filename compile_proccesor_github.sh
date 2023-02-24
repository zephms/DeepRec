
# install bazel
sudo apt install apt-transport-https curl gnupg -y
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
sudo mv bazel-archive-keyring.gpg /usr/share/keyrings
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
sudo apt update
sudo apt install bazel 0.26


cat ~/.bashrc
cat /root/.bazelrc
echo "build --local_cpu_resources=HOST_CPUS-2 " >> .bazelrc
./configure serving
bazel build //serving/processor/serving:libserving_processor.so

