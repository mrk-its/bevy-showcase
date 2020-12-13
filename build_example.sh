set -x
OUT_DIR=$(dirname $0)
export EXAMPLE=$1
export TS=$(date -u --iso-8601=seconds)
mkdir -p ${OUT_DIR}/wasm/$EXAMPLE
cp -a assets/ ${OUT_DIR}
cargo make build-example $EXAMPLE -p release
wasm-opt -Os -o out.wasm target/wasm_bg.wasm && mv out.wasm ${OUT_DIR}/wasm/${EXAMPLE}/wasm_bg.wasm
sed 's|\.js\$/, |\.js/, |' < target/wasm.js > ${OUT_DIR}/wasm/${EXAMPLE}/wasm.js
envsubst < $OUT_DIR/template_index.html > $OUT_DIR/${EXAMPLE}.html
echo
echo http://127.0.0.1:4000/${EXAMPLE}.html
#echo
test -z "$SKIP_HTTP_SERVER" && basic-http-server -x $OUT_DIR
