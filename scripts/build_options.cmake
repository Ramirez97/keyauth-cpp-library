option(GEN_PDB "Generate PDB. Default: OFF" OFF)

if(GEN_PDB)
    target_compile_options(KeyAuth PRIVATE "$<$<CONFIG:Release>:/Z7>")
    target_link_options(KeyAuth PRIVATE "$<$<CONFIG:Release>:/DEBUG>")
    target_link_options(KeyAuth PRIVATE "$<$<CONFIG:Release>:/OPT:REF>")
    target_link_options(KeyAuth PRIVATE "$<$<CONFIG:Release>:/OPT:ICF>")
endif()