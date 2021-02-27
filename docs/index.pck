GDPC                                                                               @   res://.import/HUDBck.png-d77ea0e5df999e9c939d99a537016628.stex  �"      �      ��WȚ�ͬ;U�$Pq<   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex +      U      -��`�0��x�5�[    res://Animations/HowToPlay.tres p      �      ��;��(��;,�hS   res://Scenes/Global.tscn0      �       �A'ܦ~|Q���ŧKL   res://Scenes/Player.tscn 	            u��NbL7O�$�J   res://Scenes/game.tscn        K      �Ҟ�o�Q����zl�$   res://Scenes/mainScreen.tscn`      �      #�,*��G;�qALyVHA    res://Scripts/Global.gd.remap   �:      )       GȎD�?]�)�@�W{   res://Scripts/Global.gdc�      �      ��!��ʌ��Jĭr    res://Scripts/Player.gd.remap   ;      )       <y;�9Y;�k��S�   res://Scripts/Player.gdc�      �      9��1~�<C9`nr|�$   res://Scripts/mainScreen.gd.remap   @;      -       `A]u��]��[ʞ�d��   res://Scripts/mainScreen.gdc`      �      b,m��e�������L�(   res://Scripts/playerVariables.gd.remap  p;      2       u�W����u��+���8$   res://Scripts/playerVariables.gdc   �!      �       �}#L�:���x.w�o]�,   res://Sprites/Placeholders/HUDBck.png.import�'      �      m����Ƣ[_ߐ�   res://default_env.tres  P*      �       um�`�N��<*ỳ�8   res://icon.png.import   `8      �      �����%��(#AB�   res://project.binary�;      $      'S p����(�/� �[gd_resource type="Animation" format=2]

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
"points": PoolRealArray( 0, -0.25, 0, 0.25, 0, 600, -0.25, 0, 0.25, 0 ),
"times": PoolRealArray( 0, 2 )
}
tracks/1/type = "bezier"
tracks/1/path = NodePath("How to play:rect_position:x")
tracks/1/interp = 1
tracks/1/loop_wrap = true
tracks/1/imported = false
tracks/1/enabled = true
tracks/1/keys = {
"points": PoolRealArray( -601, -0.25, 0, 0.25, 0, 0, -0.25, 0, 0.25, 0 ),
"times": PoolRealArray( 0, 2 )
}
               [gd_scene load_steps=2 format=2]

[ext_resource path="res://Scenes/mainScreen.tscn" type="PackedScene" id=1]

[node name="Global" type="Node2D"]

[node name="MainScreen" parent="." instance=ExtResource( 1 )]
[gd_scene load_steps=4 format=2]

[ext_resource path="res://icon.png" type="Texture" id=1]
[ext_resource path="res://Scripts/Player.gd" type="Script" id=2]

[sub_resource type="CircleShape2D" id=1]
radius = 8.54329

[node name="Player" type="KinematicBody2D"]
script = ExtResource( 2 )

[node name="Hitbox" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )

[node name="CollisionSprites" type="Node2D" parent="."]

[node name="SizeSprite" type="Sprite" parent="CollisionSprites"]
texture = ExtResource( 1 )
          [gd_scene load_steps=3 format=2]

[ext_resource path="res://Scenes/Player.tscn" type="PackedScene" id=1]
[ext_resource path="res://Sprites/Placeholders/HUDBck.png" type="Texture" id=2]

[node name="Game" type="Node2D"]

[node name="Player" parent="." instance=ExtResource( 1 )]
position = Vector2( 200, 300 )

[node name="HUD" type="Control" parent="."]
margin_left = 400.0
margin_right = 600.0
margin_bottom = 400.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="TextureRect" type="TextureRect" parent="HUD"]
margin_right = 40.0
margin_bottom = 40.0
texture = ExtResource( 2 )
     [gd_scene load_steps=4 format=2]

[ext_resource path="res://Scripts/mainScreen.gd" type="Script" id=1]
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
"points": PoolRealArray( 0, -0.25, 0, 0.25, 0, 400, -0.25, 0, 0.25, 0 ),
"times": PoolRealArray( 0, 2 )
}

[node name="MainScreen" type="Node2D"]
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
__meta__ = {
"_edit_use_anchors_": false
}

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
          GDSC         #   �      ���ӄ�   ������������Ӷ��   �����϶�   ���¶���   �������Ӷ���   �������¶���   ��������Ҷ��   ��������������¶   ���������Ӷ�   ���޶���   ������������Ҷ��   �������������������Ӷ���   ���Ӷ���   Ŷ��   �������������Ķ�   �������Ӷ���   ��������Ҷ��   ����������������Ӷ��                _deferred_goto_scene                         	      
                     	      
   ,      -      .      /      0      1      2      9      @      A      H      I      O      P      Q      [      \      ]      e      f      g      t       u   !   v   "      #   3YYY;�  YYYY0�  PQV�  ;�  �  PQT�  PQ�  �  �  T�  P�  T�  PQ�  QYYYYYYY0�  P�	  QV�  �
  P�  R�	  QYY0�  P�	  QV�  �  �  T�  PQ�  �  �  ;�  �  T�L  P�	  Q�  �  �  �  �  T�  PQ�  �  �  �  PQT�  PQT�  P�  Q�  �  �  �  PQT�  P�  QY`      GDSC         3        ������������τ�   ��Ŷ   ����Ӷ��   ����Ҷ��   �������϶���   ���¶���   �����϶�   ����¶��   �������¶���   ����¶��   �������������Ҷ�   ��������ⶶ�   ζ��   �������ⶶ��   ������������   ϶��   �����涶   ���������Ҷ�   �����������Ŷ���   �����������ض���   �����������ض���   ���������������Ŷ���   ����׶��   ��������ⶶ�   �������������Ӷ�          �                  �              ?                   
                               !   	   "   
   #      )      -      1      2      8      <      =      C      I      R      X      a      g      p      v            �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0   �   1     2     3   3YY;�  �  PQY;�  Y;�  �  Y;�  �  PQY;�  �  YYYY0�  PQV�  �  �  �  �  PQYY0�  PQV�  �  YY0�  PQV�  �  �  PQ�  &�	  T�
  P�  QV�  �  T�  �  �  &�	  T�
  P�  QV�  �  T�  �  �  &�	  T�
  P�  QV�  �  T�  �  �  &�	  T�
  P�  QV�  �  T�  �  �  �  �  �  T�  PQ�  YY0�  PQV�  �  �  PQ�  &�  T�  �  V�  �  T�  �  �  &�  T�  	�  V�  �  T�  �  �  &�  T�  �  V�  �  T�  �  �  &�  T�  	�  V�  �  T�  �  �  �  P�  QYYY0�  P�  QV�  �  PQ�  �  �  �  &�	  T�
  P�  QV�  �  �  �  �  �  P�  �  Q�  �  PQY` GDSC         &   �      ���Ӷ���   ����Ӷ��   ���������Ķ�   �������������Ķ�   �����϶�   �������������Ŷ�   ����������������������Ҷ   ���϶���   �����ڶ�   ���������Ӷ�   ���������������������Ҷ�   �����������������Ҷ�          	   StartGame               res://Scenes/game.tscn     	   HowToPlay                                        
                     	      
         $      %      &      '      (      )      *      +      1      9      @      D      K      L      M      N      T      \      c      g      h       i   !   j   "   p   #   x   $      %   �   &   3YYYY;�  Y5;�  W�  YYY0�  PQV�  �  �  �  T�  P�  QYYYYYYYY0�  PQV�  &P�  QV�  �  T�  P�  Q�  �  �  �  �  T�	  P�  QYYYY0�
  PQV�  &P�  QV�  �  T�  P�  Q�  �  �  YYYY0�  PQV�  &P�  �  QV�  �  T�  P�  Q�  �  Y`           GDSC                   ���Ӷ���   �����϶�                                                 	   	   
   
                                             3YYYYYYYYY0�  PQV�  -YYYYYY`         GDST�   �          �  PNG �PNG

   IHDR   �  �   d���   sRGB ���  tIDATx���Kn�@@�q�gg�(��'R�3B�x� �����y��w�'L��`��鉅3y�P[����MR�����WUq�j[+�TŽn��x�;x{�Ќ+�Z����mY�$�E�2��A���M,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,�"!,��a��W��70M��L,�"1-ζ!��ރ��"��X���~�q5V����U�����8g�����G���a}��v���p���aO ��O�m6!��{    IEND�B`�      [remap]

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

path="res://Scripts/Global.gdc"
       [remap]

path="res://Scripts/Player.gdc"
       [remap]

path="res://Scripts/mainScreen.gdc"
   [remap]

path="res://Scripts/playerVariables.gdc"
              ECFG      _global_script_classes             _global_script_class_icons             application/config/name         CSC3224    application/run/main_scene          res://Scenes/game.tscn     autoload/PlayerVariables,      !   *res://Scripts/playerVariables.gd      autoload/Global          *res://Scripts/Global.gd   display/window/size/width      X     display/window/size/height      �     display/window/size/resizable             display/window/stretch/mode         2d     display/window/stretch/aspect         keep$   rendering/quality/driver/driver_name         GLES2   %   rendering/vram_compression/import_etc         &   rendering/vram_compression/import_etc2          )   rendering/environment/default_environment          res://default_env.tres              