DIR=$(dirname $0)
for name in contributors sprite sprite_sheet 3d_scene load_gltf parenting texture z_sort_debug breakout font_atlas_debug text_debug text ui; do
SKIP_HTTP_SERVER=1 $DIR/build_example.sh $name
done
