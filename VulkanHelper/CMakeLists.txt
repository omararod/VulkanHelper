cmake_minimum_required(VERSION 3.22)

add_library(vulkanhelper STATIC VulkanHelper.cpp VulkanHelper.h stb_image.h Vertex.h Vertex.cpp ${CMAKE_SOURCE_DIR}/shaders/shader.vert ${CMAKE_SOURCE_DIR}/shaders/shader.frag)
target_include_directories(vulkanhelper PRIVATE ${VULKAN_INCLUDE_PATH} ${GLFW_INCLUDE_PATH} ${GLM_INCLUDE_PATH})
target_link_directories(vulkanhelper PRIVATE ${VULKAN_LIB_PATH} ${GLFW_LIB_PATH})
target_link_libraries(vulkanhelper vulkan-1.lib glfw3.lib)