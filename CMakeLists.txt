cmake_minimum_required(VERSION 3.22)

project(vulkanHelper)

set(CMAKE_CXX_STANDARD 17)
set(APPLICATION_NAME hello)
include(FetchContent)
find_package(Vulkan REQUIRED)

FetchContent_Declare(glfw
GIT_REPOSITORY "https://github.com/glfw/glfw"
GIT_TAG "3eaf1255b29fdf5c2895856c7be7d7185ef2b241")

FetchContent_Declare(glm
GIT_REPOSITORY "https://github.com/g-truc/glm"
GIT_TAG "5c46b9c07008ae65cb81ab79cd677ecc1934b903")

FetchContent_MakeAvailable(glfw)
FetchContent_MakeAvailable(glm)

add_subdirectory(VulkanHelper)

add_executable(${APPLICATION_NAME} main.cpp)
#set working directory to the executable's folder
set_target_properties(
    ${APPLICATION_NAME} PROPERTIES
    VS_DEBUGGER_WORKING_DIRECTORY "${PROJECT_BINARY_DIR}/${CMAKE_CFG_INTDIR}")



target_include_directories(${APPLICATION_NAME} PRIVATE VulkanHelper)
target_link_libraries(${APPLICATION_NAME} vulkanhelper)
    

add_custom_command(TARGET ${APPLICATION_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory "${PROJECT_BINARY_DIR}/${CMAKE_CFG_INTDIR}/shaders"
    COMMAND "${Vulkan_GLSLC_EXECUTABLE}" "${CMAKE_SOURCE_DIR}/shaders/shader.vert" "-o" "${PROJECT_BINARY_DIR}/${CMAKE_CFG_INTDIR}/shaders/vert.spv"
    COMMAND "${Vulkan_GLSLC_EXECUTABLE}" "${CMAKE_SOURCE_DIR}/shaders/shader.frag" "-o" "${PROJECT_BINARY_DIR}/${CMAKE_CFG_INTDIR}/shaders/frag.spv"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${PROJECT_BINARY_DIR}/${CMAKE_CFG_INTDIR}/shaders/"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${PROJECT_BINARY_DIR}/${CMAKE_CFG_INTDIR}/models/"
    COMMAND ${CMAKE_COMMAND} -E copy "${CMAKE_CURRENT_SOURCE_DIR}/models/viking_room.obj" "${PROJECT_BINARY_DIR}/${CMAKE_CFG_INTDIR}/models/"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${PROJECT_BINARY_DIR}/${CMAKE_CFG_INTDIR}/textures/"
    COMMAND ${CMAKE_COMMAND} -E copy "${CMAKE_CURRENT_SOURCE_DIR}/textures/viking_room.png" "${PROJECT_BINARY_DIR}/${CMAKE_CFG_INTDIR}/textures/"
        )
