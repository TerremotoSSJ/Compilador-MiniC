bison calculadora.y #Esto genera un archivo llamado 'calculadora.tab.c' 
                    #que es el código C generado por Bison a partir de la 
                    #gramática definida en 'calculadora.y'.

gcc calculadora.tab.c -lfl -o calc #Esto compila el archivo 'calculadora.tab.c' 
                                    #y enlaza la biblioteca Flex (libfl) para crear un 
                                    #ejecutable llamado 'calc'. Este ejecutable es el programa 
                                    #que se puede ejecutar para usar la calculadora definida en
                                    #la gramática de Bison.
