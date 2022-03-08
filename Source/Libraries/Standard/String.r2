class String
  PROPERTIES
    byte_count      : Int32  # in UTF-8 bytes
    character_count : Int32  # in whole characters
    cursor_offset   : Int32  # in bytes
    cursor_index    : Int32  # in characters
    hash_code       : Int32
    must_free       : Logical
    nativeC  "const char* utf8;"
    nativeC  "char  buffer[78];"

  NATIVE
    nativeCHeader @|RogueString* RogueString_create( const char* cstring, int count );

    nativeCCode  @|RogueString* RogueString_create( const char* cstring, int count )
                  |{
                  |  if (count == -1) count = (int) strlen(cstring);
                  |  RogueString* result = ROGUE_CREATE_OBJECT( RogueString );
                  |  result->utf8 = cstring;
                  |  result->byte_count      = count;
                  |  result->character_count = count;
                  |  printf( "Created %s of size %d\n", result->type->name, result->type->size );
                  |  return result;
                  |}
endClass

