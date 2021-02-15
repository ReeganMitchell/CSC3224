GDPC                                                                               @   res://.import/HUDBck.png-d77ea0e5df999e9c939d99a537016628.stex  @      r      ����8n�g����<   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex      U      -��`�0��x�5�[    res://Animations/HowToPlay.tres `      �      E�6�G=���xc�{�   res://Scenes/Player.tscn@      X      �#�~@�B6_U�w`�J   res://Scenes/main.tscn  �      e      �c�̸1��7A��I�{X   res://Scripts/main.gd.remap �)      '       o�s�8` �����   res://Scripts/main.gdc        .      (ʄ{���r'7<&�PZ�,   res://Sprites/Placeholders/HUDBck.png.import�      �      m����Ƣ[_ߐ�   res://default_env.tres  `      �       um�`�N��<*ỳ�8   res://icon.png.import   p'      �      �����%��(#AB�   res://project.binary *      A      #��%`�V4�|~&H��            [gd_resource type="Animation" format=2]

[resource]
resource_name = "HowToPlay"
length = 2.0
tracks/0/type = "bezier"
tracks/0/path = NodePath("Menu:rect_position:x")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"points": PoolRealArray( 0, -0.25, 0, 0.725657, -3.48843, 601, -0.408626, -160.209, 0.25, 0 ),
"times": PoolRealArray( 0, 2 )
}
tracks/1/type = "bezier"
tracks/1/path = NodePath("How to play:rect_position:x")
tracks/1/interp = 1
tracks/1/loop_wrap = true
tracks/1/imported = false
tracks/1/enabled = true
tracks/1/keys = {
"points": PoolRealArray( -601, -0.25, 0, 0.719277, 0.486511, 0, -0.204865, -84.1935, 0.25, 0 ),
"times": PoolRealArray( 0, 2 )
}
   [gd_scene load_steps=3 format=2]

[ext_resource path="res://icon.png" type="Texture" id=1]

[sub_resource type="CircleShape2D" id=1]

[node name="Player" type="KinematicBody2D"]

[node name="Sprite" type="Sprite" parent="."]
texture = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )
        [gd_scene load_steps=4 format=2]

[ext_resource path="res://Scripts/main.gd" type="Script" id=1]
[ext_resource path="res://Animations/HowToPlay.tres" type="Animation" id=2]

[sub_resource type="Animation" id=1]
resource_name = "StartGame"
length = 2.0
tracks/0/type = "bezier"
tracks/0/path = NodePath("Menu:rect_position:y")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"points": PoolRealArray( 0, -0.25, 0, 0.709089, 0.806511, 401, -0.213015, -57.5268, 0.25, 0 ),
"times": PoolRealArray( 0, 2 )
}

[node name="Main" type="Node2D"]
script = ExtResource( 1 )

[node name="Menu" type="Control" parent="."]
margin_right = 599.999
margin_bottom = 400.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="StartButton" type="Button" parent="Menu"]
margin_left = 250.0
margin_top = 250.0
margin_right = 350.0
margin_bottom = 270.0
text = "Start Game"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="How2Button" type="Button" parent="Menu"]
margin_left = 250.0
margin_top = 300.0
margin_right = 350.0
margin_bottom = 320.0
text = "How to Play"

[node name="How to play" type="Control" parent="."]
margin_left = -601.0
margin_right = -1.0
margin_bottom = 400.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Button" type="Button" parent="How to play"]
margin_left = 250.0
margin_top = 300.0
margin_right = 350.0
margin_bottom = 320.0
text = "Back to Menu"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="MenuAnimPlayer" type="AnimationPlayer" parent="."]
anims/HowToPlay = ExtResource( 2 )
anims/StartGame = SubResource( 1 )
[connection signal="pressed" from="Menu/StartButton" to="." method="_on_StartButton_pressed"]
[connection signal="pressed" from="Menu/How2Button" to="." method="_on_How2Button_pressed"]
[connection signal="pressed" from="How to play/Button" to="." method="_on_Button_pressed"]
           GDSC   
      %   ~      ���Ӷ���   ����Ӷ��   ���������Ķ�   �������������Ķ�   �����϶�   �������������Ŷ�   ����������������������Ҷ   ���϶���   ���������������������Ҷ�   �����������������Ҷ�          	   StartGame            	   HowToPlay                                        
                     	      
         $      %      &      '      (      )      *      +      1      9      @      D      E      F      G      M      U      \      `      a      b       c   !   i   "   q   #   x   $   |   %   3YYYY;�  Y5;�  W�  YYY0�  PQV�  �  �  �  T�  P�  QYYYYYYYY0�  PQV�  &P�  QV�  �  T�  P�  Q�  �  �  YYYY0�  PQV�  &P�  QV�  �  T�  P�  Q�  �  �  YYYY0�	  PQV�  &P�  �  QV�  �  T�  P�  Q�  �  Y`  GDST�   �          V  PNG �PNG

   IHDR   �  �   d���   sRGB ���  IDATx���A�  �@@Ǟ�w���XC��)��<{���� ��X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E�X$�E��0M�m�    IEND�B`�              [remap]

importer="texture"
type="StreamTexture"
path="res://.import/HUDBck.png-d77ea0e5df999e9c939d99a537016628.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Sprites/Placeholders/HUDBck.png"
dest_files=[ "res://.import/HUDBck.png-d77ea0e5df999e9c939d99a537016628.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
     [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @           9  PNG �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx�ݜytTU��?��WK*�=���%�  F����0N��݂:���Q�v��{�[�����E�ӋH���:���B�� YHB*d_*�jyo�(*M�JR!h��S�T��w�߻���ro���� N�\���D�*]��c����z��D�R�[�
5Jg��9E�|JxF׵'�a���Q���BH�~���!����w�A�b
C1�dB�.-�#��ihn�����u��B��1YSB<%�������dA�����C�$+(�����]�BR���Qsu][`
�DV����у�1�G���j�G͕IY! L1�]��� +FS�IY!IP ��|�}��*A��H��R�tQq����D`TW���p\3���M���,�fQ����d��h�m7r�U��f������.��ik�>O�;��xm��'j�u�(o}�����Q�S�-��cBc��d��rI�Ϛ�$I|]�ơ�vJkZ�9>��f����@EuC�~�2�ym�ش��U�\�KAZ4��b�4������;�X婐����@Hg@���o��W�b�x�)����3]j_��V;K����7�u����;o�������;=|��Ŗ}5��0q�$�!?��9�|�5tv�C�sHPTX@t����w�nw��۝�8�=s�p��I}�DZ-̝�ǆ�'�;=����R�PR�ۥu���u��ǻC�sH`��>�p�P ���O3R�������۝�SZ7 �p��o�P!�
��� �l��ހmT�Ƴێ�gA��gm�j����iG���B� ܦ(��cX�}4ۻB��ao��"����� ����G�7���H���æ;,NW?��[��`�r~��w�kl�d4�������YT7�P��5lF�BEc��=<�����?�:]�������G�Μ�{������n�v��%���7�eoݪ��
�QX¬)�JKb����W�[�G ��P$��k�Y:;�����{���a��&�eפ�����O�5,;����yx�b>=fc�* �z��{�fr��7��p���Ôִ�P����t^�]͑�~zs.�3����4��<IG�w�e��e��ih�/ˆ�9�H��f�?����O��.O��;!��]���x�-$E�a1ɜ�u�+7Ȃ�w�md��5���C.��\��X��1?�Nغ/�� ��~��<:k?8��X���!���[���꩓��g��:��E����>��꩓�u��A���	iI4���^v:�^l/;MC��	iI��TM-$�X�;iLH���;iI1�Zm7����P~��G�&g�|BfqV#�M������%��TM��mB�/�)����f����~3m`��������m�Ȉ�Ƽq!cr�pc�8fd���Mۨkl�}P�Л�汻��3p�̤H�>+���1D��i�aۡz�
������Z�Lz|8��.ִQ��v@�1%&���͏�������m���KH�� �p8H�4�9����/*)�aa��g�r�w��F36���(���7�fw����P��&�c����{﹏E7-f�M�).���9��$F�f r �9'1��s2).��G��{���?,�
�G��p�µ�QU�UO�����>��/�g���,�M��5�ʖ�e˃�d����/�M`�=�y=�����f�ӫQU�k'��E�F�+ =΂���
l�&���%%�������F#KY����O7>��;w���l6***B�g)�#W�/�k2�������TJ�'����=!Q@mKYYYdg��$Ib��E�j6�U�,Z�鼌Uvv6YYYԶ��}( ���ߠ#x~�s,X0�����rY��yz�	|r�6l����cN��5ϑ��KBB���5ϡ#xq�7�`=4A�o�xds)�~wO�z�^��m���n�Ds�������e|�0�u��k�ٱ:��RN��w�/!�^�<�ͣ�K1d�F����:�������ˣ����%U�Ą������l{�y����)<�G�y�`}�t��y!��O@� A� Y��sv:K�J��ՎۣQ�܃��T6y�ǯ�Zi
��<�F��1>�	c#�Ǉ��i�L��D�� �u�awe1�e&')�_�Ǝ^V�i߀4�$G�:��r��>h�hݝ������t;)�� &�@zl�Ұր��V6�T�+����0q��L���[t���N&e��Z��ˆ/����(�i啝'i�R�����?:
P].L��S��E�݅�Á�.a6�WjY$F�9P�«����V^7���1Ȓ� �b6�(����0"�k�;�@MC���N�]7 �)Q|s����QfdI���5 ��.f��#1���G���z���>)�N�>�L0T�ۘ5}��Y[�W뿼mj���n���S?�v��ْ|.FE"=�ߑ��q����������p����3�¬8�T�GZ���4ݪ�0�L�Y��jRH��.X�&�v����#�t��7y_#�[�o��V�O����^�����paV�&J�V+V��QY����f+m��(�?/������{�X��:�!:5�G�x���I����HG�%�/�LZ\8/����yLf�Æ>�X�Єǣq���$E������E�Ǣ�����gێ��s�rxO��x孏Q]n���LH����98�i�0==���O$5��o^����>6�a� �*�)?^Ca��yv&���%�5>�n�bŜL:��y�w���/��o�褨A���y,[|=1�VZ�U>,?͑���w��u5d�#�K�b�D�&�:�����l~�S\���[CrTV�$����y��;#�������6�y��3ݸ5��.�V��K���{�,-ւ� k1aB���x���	LL� ����ңl۱������!U��0L�ϴ��O\t$Yi�D�Dm��]|�m���M�3���bT�
�N_����~uiIc��M�DZI���Wgkn����C��!xSv�Pt�F��kڨ��������OKh��L����Z&ip��
ޅ���U�C�[�6��p���;uW8<n'n��nͽQ�
�gԞ�+Z	���{���G�Ĭ� �t�]�p;躆 ��.�ۣ�������^��n�ut�L �W��+ ���hO��^�w�\i� ��:9>3�=��So�2v���U1z��.�^�ߋěN���,���� �f��V�    IEND�B`�           [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
[remap]

path="res://Scripts/main.gdc"
         ECFG      _global_script_classes             _global_script_class_icons             application/config/name         CSC3224    application/run/main_scene          res://Scenes/main.tscn     display/window/size/width      X     display/window/size/height      �     display/window/size/resizable          $   rendering/quality/driver/driver_name         GLES2   %   rendering/vram_compression/import_etc         &   rendering/vram_compression/import_etc2          )   rendering/environment/default_environment          res://default_env.tres                 