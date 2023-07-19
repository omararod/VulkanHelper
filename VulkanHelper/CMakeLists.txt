cmake_minimum_required(VERSION 3.22)

add_library(vulkanhelper STATIC VulkanHelper.cpp VulkanHelper.h stb_image.h Vertex.h Vertex.cpp ${CMAKE_SOURCE_DIR}/shaders/shader.vert ${CMAKE_SOURCE_DIR}/shaders/shader.frag)
target_include_directories(vulkanhelper PRIVATE ${Vulkan_INCLUDE_DIRS} ${glm_SOURCE_DIR} )
target_link_libraries(vulkanhelper  glfw glm Vulkan::Vulkan)