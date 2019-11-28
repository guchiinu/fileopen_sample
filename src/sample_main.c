#include <stdio.h>
#include "sample.h"

#define FILE_BUFF_SIZE 10

int main(void)
{
    char *p_filename = "../file/sample.txt"; // ファイル名
    FILE *p_file; // ファイル
    char file_read_buffer[FILE_BUFF_SIZE]; // ファイル読み込み用バッファ

    // ファイルを開く
    p_file = fopen( p_filename, "r");
    if (p_file == NULL)
    {
        // ファイルが開けない
        printf("ファイルが開けない");
        return -1;
    }

    // ファイルの中身を表示する
    fread( file_read_buffer, FILE_BUFF_SIZE, 1, p_file);
    printf("%s\n", file_read_buffer);

    // ファイルを閉じる
    fclose( p_file );
    p_file = NULL;

    return 0;
}