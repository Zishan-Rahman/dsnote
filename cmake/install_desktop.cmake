install(TARGETS ${info_binary_id} RUNTIME DESTINATION bin)

install(FILES "${desktop_dir}/${info_binary_id}.desktop" DESTINATION share/applications)
install(FILES "${desktop_dir}/${info_binary_id}.svg" DESTINATION share/icons/hicolor/scalable/apps)
install(FILES "${desktop_dir}/${info_binary_id}.metainfo.xml" DESTINATION share/metainfo)

if(BUILD_WHISPERCPP)
    install(FILES "${external_lib_dir}/libwhisper.so" DESTINATION lib)
    install(FILES "${external_lib_dir}/libwhisper-fallback.so" DESTINATION lib)
endif()

if(DOWNLOAD_LIBSTT)
    install(FILES "${external_lib_dir}/libstt.so" DESTINATION lib)
    install(FILES "${external_lib_dir}/libkenlm.so" DESTINATION lib)
endif()

if(BUILD_OPENBLAS)
    install(FILES "${external_lib_dir}/libopenblas.so.0.3" DESTINATION lib RENAME libopenblas.so.0)
endif()

if(BUILD_PIPER OR BUILD_ESPEAK)
    install(PROGRAMS "${external_bin_dir}/mbrola" DESTINATION bin)
    install(DIRECTORY "${external_share_dir}/espeak-ng-data" DESTINATION share)
endif()
install(FILES "${PROJECT_BINARY_DIR}/espeakdata.tar.xz" DESTINATION share/${info_binary_id})

if(BUILD_RHVOICE)
    install(FILES "${external_lib_dir}/libRHVoice_core.so.1.2.2" DESTINATION lib RENAME libRHVoice_core.so.1)
    install(FILES "${external_lib_dir}/libRHVoice.so.1.2.2" DESTINATION lib RENAME libRHVoice.so.1)
endif()
install(FILES "${PROJECT_BINARY_DIR}/rhvoicedata.tar.xz" DESTINATION share/${info_binary_id})
install(FILES "${PROJECT_BINARY_DIR}/rhvoiceconfig.tar.xz" DESTINATION share/${info_binary_id})

if(BUILD_PIPER)
    install(FILES "${external_lib_dir}/libonnxruntime.so.1.14.1" DESTINATION lib)
endif()

if(BUILD_VOSK)
    install(FILES "${external_lib_dir}/libvosk.so" DESTINATION lib)
endif()

if(WITH_SYSTEMD_SERVICE)
    configure_file("${systemd_dir}/${id}.service" "${PROJECT_BINARY_DIR}/${info_binary_id}.service")
    install(FILES "${PROJECT_BINARY_DIR}/${info_binary_id}.service" DESTINATION lib/systemd/user)

    configure_file("${dbus_dir}/${info_dbus_service}.service" "${PROJECT_BINARY_DIR}/${info_dbus_service}.service")
    install(FILES "${PROJECT_BINARY_DIR}/${info_dbus_service}.service" DESTINATION lib/systemd/user)
endif()
