option(NANA_CMAKE_ENABLE_JPEG "Enable the use of JPEG" OFF)
option(NANA_CMAKE_LIBJPEG_FROM_OS "Use libjpeg from operating system." ON)

# todo: decide - PUBLIC vs PRIVATE

if(NANA_CMAKE_ENABLE_JPEG)
    if(NANA_CMAKE_LIBJPEG_FROM_OS)
        find_package(JPEG)
        if(JPEG_FOUND)
            target_include_directories(nana PUBLIC  ${JPEG_INCLUDE_DIR})
            target_compile_options    (nana PUBLIC  ${JPEG_LIBRARY})
            target_compile_definitions(nana PUBLIC NANA_ENABLE_JPEG USE_LIBJPEG_FROM_OS)
        endif()
    else()
        target_compile_definitions(nana PUBLIC NANA_ENABLE_JPEG)
    endif()
endif()