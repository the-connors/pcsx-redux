--lualoader, R"EOF(--
--OpenGL binding, taken and modified from https://github.com/malkia/luajit-opencl

ffi.cdef[[
enum {
 GL_SRC0_RGB                       = 0x8580,
 GL_SRC1_RGB                       = 0x8581,
 GL_SRC2_RGB                       = 0x8582,
 GL_SRC3_RGB                       = 0x8583,
 GL_SRC4_RGB                       = 0x8584,
 GL_SRC5_RGB                       = 0x8585,
 GL_SRC6_RGB                       = 0x8586,
 GL_SRC7_RGB                       = 0x8587,
 GL_SRC0_ALPHA                     = 0x8588,
 GL_SRC1_ALPHA                     = 0x8589,
 GL_SRC2_ALPHA                     = 0x858A,
 GL_SRC3_ALPHA                     = 0x858B,
 GL_SRC4_ALPHA                     = 0x858C,
 GL_SRC5_ALPHA                     = 0x858D,
 GL_SRC6_ALPHA                     = 0x858E,
 GL_SRC7_ALPHA                     = 0x858F,
 GL_SOURCE0_RGB                    = 0x8580,
 GL_SOURCE1_RGB                    = 0x8581,
 GL_SOURCE2_RGB                    = 0x8582,
 GL_SOURCE3_RGB                    = 0x8583,
 GL_SOURCE4_RGB                    = 0x8584,
 GL_SOURCE5_RGB                    = 0x8585,
 GL_SOURCE6_RGB                    = 0x8586,
 GL_SOURCE7_RGB                    = 0x8587,
 GL_SOURCE0_ALPHA                  = 0x8588,
 GL_SOURCE1_ALPHA                  = 0x8589,
 GL_SOURCE2_ALPHA                  = 0x858A,
 GL_SOURCE3_ALPHA                  = 0x858B,
 GL_SOURCE4_ALPHA                  = 0x858C,
 GL_SOURCE5_ALPHA                  = 0x858D,
 GL_SOURCE6_ALPHA                  = 0x858E,
 GL_SOURCE7_ALPHA                  = 0x858F,
 GL_OPERAND0_RGB                   = 0x8590,
 GL_OPERAND1_RGB                   = 0x8591,
 GL_OPERAND2_RGB                   = 0x8592,
 GL_OPERAND3_RGB                   = 0x8593,
 GL_OPERAND4_RGB                   = 0x8594,
 GL_OPERAND5_RGB                   = 0x8595,
 GL_OPERAND6_RGB                   = 0x8596,
 GL_OPERAND7_RGB                   = 0x8597,
 GL_OPERAND0_ALPHA                 = 0x8598,
 GL_OPERAND1_ALPHA                 = 0x8599,
 GL_OPERAND2_ALPHA                 = 0x859A,
 GL_OPERAND3_ALPHA                 = 0x859B,
 GL_OPERAND4_ALPHA                 = 0x859C,
 GL_OPERAND5_ALPHA                 = 0x859D,
 GL_OPERAND6_ALPHA                 = 0x859E,
 GL_OPERAND7_ALPHA                 = 0x859F,
 GL_DOT3_RGB                       = 0x86AE,
 GL_DOT3_RGBA                      = 0x86AF,
 GL_TRANSPOSE_MODELVIEW_MATRIX     = 0x84E3,
 GL_TRANSPOSE_PROJECTION_MATRIX    = 0x84E4,
 GL_TRANSPOSE_TEXTURE_MATRIX       = 0x84E5,
 GL_TRANSPOSE_COLOR_MATRIX         = 0x84E6,
 GL_NORMAL_MAP                     = 0x8511,
 GL_REFLECTION_MAP                 = 0x8512,
 GL_TEXTURE_CUBE_MAP               = 0x8513,
 GL_TEXTURE_BINDING_CUBE_MAP       = 0x8514,
 GL_TEXTURE_CUBE_MAP_POSITIVE_X    = 0x8515,
 GL_TEXTURE_CUBE_MAP_NEGATIVE_X    = 0x8516,
 GL_TEXTURE_CUBE_MAP_POSITIVE_Y    = 0x8517,
 GL_TEXTURE_CUBE_MAP_NEGATIVE_Y    = 0x8518,
 GL_TEXTURE_CUBE_MAP_POSITIVE_Z    = 0x8519,
 GL_TEXTURE_CUBE_MAP_NEGATIVE_Z    = 0x851A,
 GL_PROXY_TEXTURE_CUBE_MAP         = 0x851B,
 GL_MAX_CUBE_MAP_TEXTURE_SIZE      = 0x851C,
 GL_COMPRESSED_ALPHA               = 0x84E9,
 GL_COMPRESSED_LUMINANCE           = 0x84EA,
 GL_COMPRESSED_LUMINANCE_ALPHA     = 0x84EB,
 GL_COMPRESSED_INTENSITY           = 0x84EC,
 GL_COMPRESSED_RGB                 = 0x84ED,
 GL_COMPRESSED_RGBA                = 0x84EE,
 GL_TEXTURE_COMPRESSION_HINT       = 0x84EF,
 GL_TEXTURE_COMPRESSED_IMAGE_SIZE  = 0x86A0,
 GL_TEXTURE_COMPRESSED             = 0x86A1,
 GL_NUM_COMPRESSED_TEXTURE_FORMATS = 0x86A2,
 GL_COMPRESSED_TEXTURE_FORMATS     = 0x86A3,
 GL_MULTISAMPLE                    = 0x809D,
 GL_SAMPLE_ALPHA_TO_COVERAGE       = 0x809E,
 GL_SAMPLE_ALPHA_TO_ONE            = 0x809F,
 GL_SAMPLE_COVERAGE                = 0x80A0,
 GL_SAMPLE_BUFFERS                 = 0x80A8,
 GL_SAMPLES                        = 0x80A9,
 GL_SAMPLE_COVERAGE_VALUE          = 0x80AA,
 GL_SAMPLE_COVERAGE_INVERT         = 0x80AB,
 GL_MULTISAMPLE_BIT                = 0x20000000,
 GL_DEPTH_COMPONENT16              = 0x81A5,
 GL_DEPTH_COMPONENT24              = 0x81A6,
 GL_DEPTH_COMPONENT32              = 0x81A7,
 GL_TEXTURE_DEPTH_SIZE             = 0x884A,
 GL_DEPTH_TEXTURE_MODE             = 0x884B,
 GL_TEXTURE_COMPARE_MODE           = 0x884C,
 GL_TEXTURE_COMPARE_FUNC           = 0x884D,
 GL_COMPARE_R_TO_TEXTURE           = 0x884E,
 GL_QUERY_COUNTER_BITS             = 0x8864,
 GL_CURRENT_QUERY                  = 0x8865,
 GL_QUERY_RESULT                   = 0x8866,
 GL_QUERY_RESULT_AVAILABLE         = 0x8867,
 GL_SAMPLES_PASSED                 = 0x8914,
 GL_FOG_COORD_SRC                  = 0x8450,
 GL_FOG_COORD                      = 0x8451,
 GL_FRAGMENT_DEPTH                 = 0x8452,
 GL_CURRENT_FOG_COORD              = 0x8453  ,
 GL_FOG_COORD_ARRAY_TYPE           = 0x8454,
 GL_FOG_COORD_ARRAY_STRIDE         = 0x8455,
 GL_FOG_COORD_ARRAY_POINTER        = 0x8456,
 GL_FOG_COORD_ARRAY                = 0x8457,
 GL_FOG_COORDINATE_SOURCE          = 0x8450,
 GL_FOG_COORDINATE                 = 0x8451,
 GL_CURRENT_FOG_COORDINATE         = 0x8453  ,
 GL_FOG_COORDINATE_ARRAY_TYPE      = 0x8454,
 GL_FOG_COORDINATE_ARRAY_STRIDE    = 0x8455,
 GL_FOG_COORDINATE_ARRAY_POINTER   = 0x8456,
 GL_FOG_COORDINATE_ARRAY           = 0x8457,
 GL_COLOR_SUM                      = 0x8458,
 GL_CURRENT_SECONDARY_COLOR        = 0x8459,
 GL_SECONDARY_COLOR_ARRAY_SIZE     = 0x845A,
 GL_SECONDARY_COLOR_ARRAY_TYPE     = 0x845B,
 GL_SECONDARY_COLOR_ARRAY_STRIDE   = 0x845C,
 GL_SECONDARY_COLOR_ARRAY_POINTER  = 0x845D,
 GL_SECONDARY_COLOR_ARRAY          = 0x845E,
 GL_POINT_SIZE_MIN                 = 0x8126,
 GL_POINT_SIZE_MAX                 = 0x8127,
 GL_POINT_FADE_THRESHOLD_SIZE      = 0x8128,
 GL_POINT_DISTANCE_ATTENUATION     = 0x8129,
 GL_BLEND_DST_RGB                  = 0x80C8,
 GL_BLEND_SRC_RGB                  = 0x80C9,
 GL_BLEND_DST_ALPHA                = 0x80CA,
 GL_BLEND_SRC_ALPHA                = 0x80CB,
 GL_GENERATE_MIPMAP                = 0x8191,
 GL_GENERATE_MIPMAP_HINT           = 0x8192,
 GL_INCR_WRAP                      = 0x8507,
 GL_DECR_WRAP                      = 0x8508,
 GL_MIRRORED_REPEAT                = 0x8370,
 GL_MAX_TEXTURE_LOD_BIAS           = 0x84FD,
 GL_TEXTURE_FILTER_CONTROL         = 0x8500,
 GL_TEXTURE_LOD_BIAS               = 0x8501,
 GL_ARRAY_BUFFER                                = 0x8892,
 GL_ELEMENT_ARRAY_BUFFER                        = 0x8893,
 GL_ARRAY_BUFFER_BINDING                        = 0x8894,
 GL_ELEMENT_ARRAY_BUFFER_BINDING                = 0x8895,
 GL_VERTEX_ARRAY_BUFFER_BINDING                 = 0x8896,
 GL_NORMAL_ARRAY_BUFFER_BINDING                 = 0x8897,
 GL_COLOR_ARRAY_BUFFER_BINDING                  = 0x8898,
 GL_INDEX_ARRAY_BUFFER_BINDING                  = 0x8899,
 GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING          = 0x889A,
 GL_EDGE_FLAG_ARRAY_BUFFER_BINDING              = 0x889B,
 GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING        = 0x889C,
 GL_FOG_COORD_ARRAY_BUFFER_BINDING              = 0x889D,
 GL_WEIGHT_ARRAY_BUFFER_BINDING                 = 0x889E,
 GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING          = 0x889F,
 GL_STREAM_DRAW                                 = 0x88E0,
 GL_STREAM_READ                                 = 0x88E1,
 GL_STREAM_COPY                                 = 0x88E2,
 GL_STATIC_DRAW                                 = 0x88E4,
 GL_STATIC_READ                                 = 0x88E5,
 GL_STATIC_COPY                                 = 0x88E6,
 GL_DYNAMIC_DRAW                                = 0x88E8,
 GL_DYNAMIC_READ                                = 0x88E9,
 GL_DYNAMIC_COPY                                = 0x88EA,
 GL_READ_ONLY                                   = 0x88B8,
 GL_WRITE_ONLY                                  = 0x88B9,
 GL_READ_WRITE                                  = 0x88BA,
 GL_BUFFER_SIZE                                 = 0x8764,
 GL_BUFFER_USAGE                                = 0x8765,
 GL_BUFFER_ACCESS                               = 0x88BB,
 GL_BUFFER_MAPPED                               = 0x88BC,
 GL_BUFFER_MAP_POINTER                          = 0x88BD,
 GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING         = 0x889D,
 GL_CURRENT_PROGRAM                = 0x8B8D,
 GL_SHADER_TYPE                    = 0x8B4F,
 GL_DELETE_STATUS                  = 0x8B80,
 GL_COMPILE_STATUS                 = 0x8B81,
 GL_LINK_STATUS                    = 0x8B82,
 GL_VALIDATE_STATUS                = 0x8B83,
 GL_INFO_LOG_LENGTH                = 0x8B84,
 GL_ATTACHED_SHADERS               = 0x8B85,
 GL_ACTIVE_UNIFORMS                = 0x8B86,
 GL_ACTIVE_UNIFORM_MAX_LENGTH      = 0x8B87,
 GL_SHADER_SOURCE_LENGTH           = 0x8B88,
 GL_FLOAT_VEC2                     = 0x8B50,
 GL_FLOAT_VEC3                     = 0x8B51,
 GL_FLOAT_VEC4                     = 0x8B52,
 GL_INT_VEC2                       = 0x8B53,
 GL_INT_VEC3                       = 0x8B54,
 GL_INT_VEC4                       = 0x8B55,
 GL_BOOL                           = 0x8B56,
 GL_BOOL_VEC2                      = 0x8B57,
 GL_BOOL_VEC3                      = 0x8B58,
 GL_BOOL_VEC4                      = 0x8B59,
 GL_FLOAT_MAT2                     = 0x8B5A,
 GL_FLOAT_MAT3                     = 0x8B5B,
 GL_FLOAT_MAT4                     = 0x8B5C,
 GL_SAMPLER_1D                     = 0x8B5D,
 GL_SAMPLER_2D                     = 0x8B5E,
 GL_SAMPLER_3D                     = 0x8B5F,
 GL_SAMPLER_CUBE                   = 0x8B60,
 GL_SAMPLER_1D_SHADOW              = 0x8B61,
 GL_SAMPLER_2D_SHADOW              = 0x8B62,
 GL_SHADING_LANGUAGE_VERSION       = 0x8B8C,
 GL_VERTEX_SHADER                  = 0x8B31,
 GL_MAX_VERTEX_UNIFORM_COMPONENTS  = 0x8B4A,
 GL_MAX_VARYING_FLOATS             = 0x8B4B,
 GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS = 0x8B4C,
 GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D,
 GL_ACTIVE_ATTRIBUTES              = 0x8B89,
 GL_ACTIVE_ATTRIBUTE_MAX_LENGTH    = 0x8B8A,
 GL_FRAGMENT_SHADER                = 0x8B30,
 GL_MAX_FRAGMENT_UNIFORM_COMPONENTS = 0x8B49,
 GL_FRAGMENT_SHADER_DERIVATIVE_HINT = 0x8B8B,
 GL_MAX_VERTEX_ATTRIBS             = 0x8869,
 GL_VERTEX_ATTRIB_ARRAY_ENABLED    = 0x8622,
 GL_VERTEX_ATTRIB_ARRAY_SIZE       = 0x8623,
 GL_VERTEX_ATTRIB_ARRAY_STRIDE     = 0x8624,
 GL_VERTEX_ATTRIB_ARRAY_TYPE       = 0x8625,
 GL_VERTEX_ATTRIB_ARRAY_NORMALIZED = 0x886A,
 GL_CURRENT_VERTEX_ATTRIB          = 0x8626,
 GL_VERTEX_ATTRIB_ARRAY_POINTER    = 0x8645,
 GL_VERTEX_PROGRAM_POINT_SIZE      = 0x8642,
 GL_VERTEX_PROGRAM_TWO_SIDE        = 0x8643,
 GL_MAX_TEXTURE_COORDS             = 0x8871,
 GL_MAX_TEXTURE_IMAGE_UNITS        = 0x8872,
 GL_MAX_DRAW_BUFFERS               = 0x8824,
 GL_DRAW_BUFFER0                   = 0x8825,
 GL_DRAW_BUFFER1                   = 0x8826,
 GL_DRAW_BUFFER2                   = 0x8827,
 GL_DRAW_BUFFER3                   = 0x8828,
 GL_DRAW_BUFFER4                   = 0x8829,
 GL_DRAW_BUFFER5                   = 0x882A,
 GL_DRAW_BUFFER6                   = 0x882B,
 GL_DRAW_BUFFER7                   = 0x882C,
 GL_DRAW_BUFFER8                   = 0x882D,
 GL_DRAW_BUFFER9                   = 0x882E,
 GL_DRAW_BUFFER10                  = 0x882F,
 GL_DRAW_BUFFER11                  = 0x8830,
 GL_DRAW_BUFFER12                  = 0x8831,
 GL_DRAW_BUFFER13                  = 0x8832,
 GL_DRAW_BUFFER14                  = 0x8833,
 GL_DRAW_BUFFER15                  = 0x8834,
 GL_POINT_SPRITE                   = 0x8861,
 GL_COORD_REPLACE                  = 0x8862,
 GL_POINT_SPRITE_COORD_ORIGIN      = 0x8CA0,
 GL_LOWER_LEFT                     = 0x8CA1,
 GL_UPPER_LEFT                     = 0x8CA2,
 GL_STENCIL_BACK_FUNC              = 0x8800,
 GL_STENCIL_BACK_VALUE_MASK        = 0x8CA4,
 GL_STENCIL_BACK_REF               = 0x8CA3,
 GL_STENCIL_BACK_FAIL              = 0x8801,
 GL_STENCIL_BACK_PASS_DEPTH_FAIL   = 0x8802,
 GL_STENCIL_BACK_PASS_DEPTH_PASS   = 0x8803,
 GL_STENCIL_BACK_WRITEMASK         = 0x8CA5,
 GL_CURRENT_RASTER_SECONDARY_COLOR = 0x845F,
 GL_PIXEL_PACK_BUFFER              = 0x88EB,
 GL_PIXEL_UNPACK_BUFFER            = 0x88EC,
 GL_PIXEL_PACK_BUFFER_BINDING      = 0x88ED,
 GL_PIXEL_UNPACK_BUFFER_BINDING    = 0x88EF,
 GL_FLOAT_MAT2x3                   = 0x8B65,
 GL_FLOAT_MAT2x4                   = 0x8B66,
 GL_FLOAT_MAT3x2                   = 0x8B67,
 GL_FLOAT_MAT3x4                   = 0x8B68,
 GL_FLOAT_MAT4x2                   = 0x8B69,
 GL_FLOAT_MAT4x3                   = 0x8B6A,
 GL_SRGB                           = 0x8C40,
 GL_SRGB8                          = 0x8C41,
 GL_SRGB_ALPHA                     = 0x8C42,
 GL_SRGB8_ALPHA8                   = 0x8C43,
 GL_SLUMINANCE_ALPHA               = 0x8C44,
 GL_SLUMINANCE8_ALPHA8             = 0x8C45,
 GL_SLUMINANCE                     = 0x8C46,
 GL_SLUMINANCE8                    = 0x8C47,
 GL_COMPRESSED_SRGB                = 0x8C48,
 GL_COMPRESSED_SRGB_ALPHA          = 0x8C49,
 GL_COMPRESSED_SLUMINANCE          = 0x8C4A,
 GL_COMPRESSED_SLUMINANCE_ALPHA    = 0x8C4B,
};
]]

-- )EOF"
