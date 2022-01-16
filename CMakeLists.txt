cmake_minimum_required(VERSION 3.22)
set(CMAKE_CXX_STANDARD 17)

set(APPLICATION_NAME hello)

set(VULKAN_INCLUDE_PATH C:/VulkanSDK/1.2.198.1/Include)
set(VULKAN_LIB_PATH C:/VulkanSDK/1.2.198.1/Lib)
set(APPLICATION_NAME hello)

set(GLFW_INCLUDE_PATH C:/glfw-3.3.6.bin.WIN64/glfw-3.3.6.bin.WIN64/include)
set(GLFW_LIB_PATH C:/glfw-3.3.6.bin.WIN64/glfw-3.3.6.bin.WIN64/lib-vc2022)

set(GLM_INCLUDE_PATH C:/glm-0.9.9.8/glm)

set(STB_INCLUDE_PATH C:/stb-master)

set(TINYOBJ_INCLUDE_PATH C:/tinyobjloader-master)

project(vulkanHelper)

add_subdirectory(VulkanHelper)

add_executable(${APPLICATION_NAME} main.cpp)
#set working directory to the executable's folder
set_target_properties(
    ${APPLICATION_NAME} PROPERTIES
    VS_DEBUGGER_WORKING_DIRECTORY "${PROJECT_BINARY_DIR}/${CMAKE_CFG_INTDIR}")



target_include_directories(${APPLICATION_NAME} PRIVATE VulkanHelper ${VULKAN_INCLUDE_PATH} ${GLFW_INCLUDE_PATH} ${GLM_INCLUDE_PATH} ${STB_INCLUDE_PATH} ${TINYOBJ_INCLUDE_PATH})
target_link_directories(${APPLICATION_NAME} PRIVATE ${VULKAN_LIB_PATH} ${GLFW_LIB_PATH})
target_link_libraries(${APPLICATION_NAME} vulkanhelper)


add_custom_command(TARGET ${APPLICATION_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory "${PROJECT_BINARY_DIR}/${CMAKE_CFG_INTDIR}/shaders/"
    COMMAND ${CMAKE_COMMAND} -E copy "${CMAKE_CURRENT_SOURCE_DIR}/shaders/frag.spv" "${PROJECT_BINARY_DIR}/${CMAKE_CFG_INTDIR}/shaders/"
    COMMAND ${CMAKE_COMMAND} -E copy "${CMAKE_CURRENT_SOURCE_DIR}/shaders/vert.spv" "${PROJECT_BINARY_DIR}/${CMAKE_CFG_INTDIR}/shaders/"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${PROJECT_BINARY_DIR}/${CMAKE_CFG_INTDIR}/models/"
    COMMAND ${CMAKE_COMMAND} -E copy "${CMAKE_CURRENT_SOURCE_DIR}/models/viking_room.obj" "${PROJECT_BINARY_DIR}/${CMAKE_CFG_INTDIR}/models/"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${PROJECT_BINARY_DIR}/${CMAKE_CFG_INTDIR}/textures/"
    COMMAND ${CMAKE_COMMAND} -E copy "${CMAKE_CURRENT_SOURCE_DIR}/textures/texture.jpg" "${PROJECT_BINARY_DIR}/${CMAKE_CFG_INTDIR}/textures/"
        )
