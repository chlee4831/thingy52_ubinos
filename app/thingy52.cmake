set_cache(NRF5SDK__BOARD_NAME                                                   "PCA10040"  STRING)

set_cache(NRF5SDK__SWI_DISABLE0                                                 TRUE    BOOL)

set_cache(UBINOS__BSP__LINK_MEMMAP_RAM_ORIGIN                                   0x20004400     STRING)
set_cache(UBINOS__BSP__LINK_MEMMAP_RAM_LENGTH                                   0x0000BC00     STRING)

set_cache(UBINOS__UBIK__MSGQ_MSGSIZE_MAX   32 STRING)

set_cache(UBINOS__BSP__USE_DTTY	TRUE   BOOL)
set_cache(NRF5SDK__UART_ENABLED	FALSE   BOOL)
set_cache(NRF5SDK__ENABLE_APP_UART_FIFO	FALSE   BOOL)
set_cache(UBINOS__BSP__DTTY_TYPE EXTERNAL STRING)
set_cache(SEGGERRTT__DTTY_ENABLE TRUE BOOL)

include(${PROJECT_UBINOS_DIR}/config/ubinos_nrf52dk_softdevice.cmake)
include(${PROJECT_LIBRARY_DIR}/seggerrtt_wrapper/config/seggerrtt.cmake)
include(${PROJECT_LIBRARY_DIR}/nrf5sdk_wrapper/config/nrf5sdk.cmake)
include(${PROJECT_LIBRARY_DIR}/thingy52_wrapper/config/thingy52.cmake)

add_compile_definitions(BLE_STACK_SUPPORT_REQD NRF52_PAN_12 NRF52_PAN_15 NRF52_PAN_20 NRF52_PAN_30 NRF52_PAN_31 NRF52_PAN_36 NRF52_PAN_51 NRF52_PAN_53 NRF52_PAN_54 NRF52_PAN_55 NRF52_PAN_58 NRF52_PAN_62 NRF52_PAN_63 NRF52_PAN_64 S132 NRF52 SOFTDEVICE_PRESENT SWI_DISABLE0 DEBUG ARM_MATH_CM4 MPU9250 EMPL USE_DMP EMPL_TARGET_NRF52 NO_VTOR_CONFIG)

set(INCLUDE__APP TRUE)
set(APP__NAME "appmain")

get_filename_component(_tmp_source_dir "${CMAKE_CURRENT_LIST_DIR}" ABSOLUTE)

file(GLOB_RECURSE _tmp_sources
    "${_tmp_source_dir}/*.c"
    "${_tmp_source_dir}/*.cpp"
    "${_tmp_source_dir}/*.S"
    "${_tmp_source_dir}/*.s")

set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_sources})

include_directories(${_tmp_source_dir})
include_directories(${_tmp_source_dir}/config)

include_directories(${PROJECT_LIBRARY_DIR}/nrf5sdk_v17.00.00_lite/components/toolchain/cmsis/dsp/Include)

get_filename_component(_tmp_source_dir "${NRF5SDK__BASE_DIR}" ABSOLUTE)

set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_source_dir}/integration/nrfx/legacy/nrf_drv_ppi.c)
set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_source_dir}/integration/nrfx/legacy/nrf_drv_spi.c)
set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_source_dir}/integration/nrfx/legacy/nrf_drv_twi.c)

set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_timer.c)
set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_ppi.c)
set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_spi.c)
set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_twi.c)
set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_saadc.c)
set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_pdm.c)
set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_pwm.c)

