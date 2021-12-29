[len1,angles1,curv1]=ExtractFeatures('IMG_0001_mask.png');
[len2,angles2,curv2]=ExtractFeatures('IMG_0002_mask.png'); 
[len3,angles3,curv3]=ExtractFeatures('IMG_0003_mask.png');
[len4,angles4,curv4]=ExtractFeatures('IMG_0004_mask.png'); 
[len5,angles5,curv5]=ExtractFeatures('IMG_0005_mask.png');
[len6,angles6,curv6]=ExtractFeatures('IMG_0006_mask.png'); 
[len7,angles7,curv7]=ExtractFeatures('IMG_0007_mask.png');
[len8,angles8,curv8]=ExtractFeatures('IMG_0008_mask.png'); 
 
[len1,len2,len3,len4,len5,len6,len7,len8]=normalise(len1,len2,len3,len4,len5,len6,len7,len8);
[angles1,angles2,angles3,angles4,angles5,angles6,angles7,angles8]=normalise(angles1,angles2,angles3,angles4,angles5,angles6,angles7,angles8);
[curv1,curv2,curv3,curv4,curv5,curv6,curv7,curv8]=normalise(curv1,curv2,curv3,curv4,curv5,curv6,curv7,curv8);

vec1=[len1;angles1;curv1];
vec2=[len2;angles2;curv2];
vec3=[len3;angles3;curv3];
vec4=[len4;angles4;curv4];
vec5=[len5;angles5;curv5];
vec6=[len6;angles6;curv6];
vec7=[len7;angles7;curv7];
vec8=[len8;angles8;curv8];





