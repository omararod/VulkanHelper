#include <VulkanHelper.h>
int main() {
    VulkanHelper app;

    try {
        app.run();
    }
    catch (const std::exception& e) {
        std::cerr << e.what() << std::endl;
        return EXIT_FAILURE;
    }
    std::cout << std::filesystem::current_path() << std::endl;
    return EXIT_SUCCESS;
}