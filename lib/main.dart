import 'package:flutter/material.dart';

void main() {
  runApp(const BibliotecaApp());
}

class BibliotecaApp extends StatelessWidget {
  const BibliotecaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minha Biblioteca',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6A4C93),
        ),
        scaffoldBackgroundColor: const Color(0xFFFAF7F0),
        useMaterial3: true,
      ),
      home: const Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int categoriaSelecionada = 0;
  int paginaSelecionada = 0;

  final categorias = [
    'Todos',
    'Romance',
    'Fantasia',
    'Ficção',
    'Suspense',
    'Terror',
  ];

  final livros = [
    ['📕', 'É Assim que Acaba', 'Colleen Hoover', 'Romance'],
    ['📗', 'Harry Potter', 'J.K. Rowling', 'Fantasia'],
    ['📘', 'O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Ficção'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF7F0),
        title: const Text(
          'Minha Biblioteca',
          style: TextStyle(
            color: Color(0xFF6A4C93),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Olá!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF34263F),
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Qual livro vamos ler hoje?',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar livros...',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFF6A4C93),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'Categorias',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF34263F),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 42,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categorias.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(categorias[index]),
                      selected: categoriaSelecionada == index,
                      selectedColor: const Color(0xFFE8DDF2),
                      labelStyle: TextStyle(
                        color: categoriaSelecionada == index
                            ? const Color(0xFF6A4C93)
                            : Colors.black87,
                        fontWeight: categoriaSelecionada == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                      onSelected: (selecionada) {
                        setState(() {
                          categoriaSelecionada = index;
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Livro em destaque',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF34263F),
              ),
            ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF6A4C93),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [

                  Container(
                    width: 90,
                    height: 125,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAF7F0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        '📖',
                        style: TextStyle(fontSize: 45),
                      ),
                    ),
                  ),

                  const SizedBox(width: 18),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          'O Pequeno Príncipe',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          'Antoine de Saint-Exupéry',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),

                        SizedBox(height: 12),

                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '4,8',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 12),

                        Text(
                          'Uma história clássica sobre amizade, amor e descobertas.',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Livros populares',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF34263F),
              ),
            ),

            const SizedBox(height: 12),

            ...livros.map((livro) {
              return Card(
                color: Colors.white,
                elevation: 1,
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(

                  leading: Container(
                    width: 45,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8DDF2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: Text(
                        livro[0],
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),

                  title: Text(
                    livro[1],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  subtitle: Text(
                    '${livro[2]} • ${livro[3]}',
                  ),

                  trailing: const Icon(
                    Icons.favorite_border,
                    color: Color(0xFF6A4C93),
                  ),
                ),
              );
            }),
          ],
        ),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: paginaSelecionada,

        onDestinationSelected: (index) {
          setState(() {
            paginaSelecionada = index;
          });
        },

        destinations: const [

          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(
              Icons.home,
              color: Color(0xFF6A4C93),
            ),
            label: 'Início',
          ),

          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(
              Icons.favorite,
              color: Color(0xFF6A4C93),
            ),
            label: 'Favoritos',
          ),

          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(
              Icons.menu_book,
              color: Color(0xFF6A4C93),
            ),
            label: 'Biblioteca',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(
              Icons.person,
              color: Color(0xFF6A4C93),
            ),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}