

apt update -y && apt install curl build-essential -y
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

cargo install cargo-get
export TAG=$(cargo get package.version)
export REGISTRY="jumpboxacademy/nongkai"
export IMAGE=$REGISTRY:$TAG
echo current image: $IMAGE
# # docker build -t $REGISTRY:$TAG .
echo $REGISTRY_PASS | docker login -u jumpboxacademy --password-stdin
# #docker push $REGISTRY:$TAG
# yq -i '.spec.template.spec.con