#ifndef LAB_H
#define LAB_H

#define ERRO_LISTA_VAZIA -1
#define POSICAO_INEXISTENTE -2
#define ERROARQ -3
#define ERROALLOC -4
#define COL 35
#define LIN 10
#define INALCANCAVEL -10



//define estrutura eletemnto de lista
typedef struct elemento{
	int info;
	struct elemento *proximo;
}Elemento;

//define estrutura de cabeçalho da lista
typedef struct{
	int tamanho;
	Elemento *cabeca;
}ListaEncadeada;


//protótipo da funções
ListaEncadeada *criaLista();
int estah_vazia_listaenc(ListaEncadeada *lista);
int pertenceALista(ListaEncadeada *lista, int elemento);
void destroi_lista(ListaEncadeada *lista);
ListaEncadeada *caminhoInicial(ListaEncadeada **mapa, int **vet, char **lab, ListaEncadeada *pilha, int inicio);
int adicionaNoInicio(ListaEncadeada *lista, int dados);
int adicionaNoFim(ListaEncadeada *lista, int dados);
int removeElemento(ListaEncadeada *lista);
void imprime_lista(ListaEncadeada *lista);
int carga(char *nomeArquivo, char **lab, int **vertices);
ListaEncadeada *caminhoMinimo(char **labirinto, int **vertices);
int qtdVertices(int **vertices);
int procuraNoMapa(ListaEncadeada **mapa, int elemento, int qV);

//ListaEncadeada** mapeamento(int **vertices);
int posInicio(int **vet, char **lab);
int posSaida(int **vet, char **lab);
int pCima(int x, int y, int **v);
int pBaixo(int x, int y,  int **v);
int pEsquerda(int x, int y,  int **v);
int pDireita(int x, int y,  int **v);
#endif

