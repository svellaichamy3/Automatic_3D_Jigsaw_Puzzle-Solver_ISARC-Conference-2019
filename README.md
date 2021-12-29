# Automatic 3D Jigsaw Puzzle solver with applications in archaeology for reassembling fragments

## Abstract
A major bottleneck activity in the process of restoration of Heritage Structures is the reassembly of its fragments. Computer-aided reassembly could assist in finding the relation between them thereby reducing time, manpower and potential degradation to fragile fragments. Using geometric compatibility between the adjacent fragments as the central idea, a reassembly framework for a three-dimensional shell is proposed. Edges are extracted as polygons and relevant features are computed at each of its vertices. Sequences of the match for two fragments in the feature space are found using a modified version of Smith-Waterman Algorithm. Each match is assessed using a connectivity score. The final choice of best match is left to the user by displaying the resultant assembled fragments of prospective candidates along with the score. After pairwise matching, the global reassembly is done through a clustering-based method. This framework can handle fragments with curved edges which can be reasonably approximated by a set of edges. We verify the methodology using a simulated dataset for both 2D pieces and a shattered 3D surface object.

## Approach
* Creating the dataset using Autodesk MAYA
![]<images/Input Fragments.PNG>
