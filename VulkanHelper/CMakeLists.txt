cmake_minimum_required(VERSION 3.22)
set(VULKAN_INCLUDE_PATH C:/VulkanSDK/1.2.198.1/Include)
set(VULKAN_LIB_PATH C:/VulkanSDK/1.2.198.1/Lib)
set(APPLICATION_NAME hello)

set(GLFW_INCLUDE_PATH C:/glfw-3.3.6.bin.WIN64/glfw-3.3.6.bin.WIN64/include)
set(GLFW_LIB_PATH C:/glfw-3.3.6.bin.WIN64/glfw-3.3.6.bin.WIN64/lib-vc2022)

set(GLM_INCLUDE_PATH C:/glm-0.9.9.8/glm)

set(STB_INCLUDE_PATH C:/stb-master)

set(TINYOBJ_INCLUDE_PATH C:/tinyobjloader-master)


add_library(vulkanhelper STATIC VulkanHelper.cpp VulkanHelper.h)
target_include_directories(vulkanhelper PRIVATE ${VULKAN_INCLUDE_PATH} ${GLFW_INCLUDE_PATH} ${GLM_INCLUDE_PATH} ${STB_INCLUDE_PATH} ${TINYOBJ_INCLUDE_PATH})
target_link_directories(vulkanhelper PRIVATE ${VULKAN_LIB_PATH} ${GLFW_LIB_PATH})
target_link_libraries(vulkanhelper vulkan-1.lib glfw3.lib)