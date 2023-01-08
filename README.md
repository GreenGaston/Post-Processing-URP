# Post-Processing-URP

This repository contains post processing effects implemented in the Universal Rendering Pipeline in unity

All of the post processing effects were made by Acerola in the following repository:https://github.com/GarrettGunnell/Post-Processing
you should visit this link for a overview of all the effects, his disclaimer applies to this repository too.

I used this guide:https://www.febucci.com/2022/05/custom-post-processing-in-urp/ to implement the effects in urp

# How to use

The unity scenario is a standerd first person Scene from unity. all added Files are in the "Better Shaders" folder
There is a Volume in the scene called Global Volume, When clicked you can Add overides in the inspecter. you will have 2 branches: "Custom" and "Post-Processing" Custom contains the shaders from Acerola and post-processing will contain the default post-processing effects provided by unity

currently it is set as a Global volume but you can make it a localised effect by setting its mode to local
# code is bad
Various gripes i have with this code
## materials
i use materials to get the shaders into the rendering passes, and im pretty sure this can be done another way but im not sure how
## enums not represented well
currently all enum types from Acerolas code are represented as Clamped integers as i couldn't find a way to represent enums in Volumes
## so many passes
all passes are currently being put in the pipeline in CustomPostProcessRenderer but it looks kinda stupid
##hard to order effects
Currently it is annoying to switch the ordering of postprocessing effects as you can only append them in volumes
## variables always start at minimal
Clamped variables are always set to their minimal values because otherwise they break
## general unclean code
1. shader files in the main folder while they should be in the colorblind folder
2. effects being called variables in volumes
3. gooch shading not working yet (if it all possible as post processing effect)
4. recources consisting of only materials to contain the shader
5. creating a new thing now has every custom material as an option


