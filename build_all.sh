DIR=$(dirname $0)
for name in contributors sprite sprite_sheet 3d_scene pbr load_gltf parenting texture breakout font_atlas_debug text_debug text ui button shader_defs shader_custom_material mesh_custom_attribute; do
SKIP_HTTP_SERVER=1 $DIR/build_example.sh $name
done

