import 'package:flutter/material.dart';

import '../styles/appbar_styles.dart';
import 'detalhes_cuidador_page.dart';

class CuidadoresPage extends StatefulWidget {
  const CuidadoresPage({super.key});

  @override
  State<CuidadoresPage> createState() => _CuidadoresPageState();
}

class _CuidadoresPageState extends State<CuidadoresPage> {

  // Lista de cuidadores
  final List<Map<String, dynamic>> cuidadores = [

    {
      'nome': 'Ana Souza',
      'servico': 'Passeio e hospedagem',
      'avaliacao': 4.9,
      'distancia': '0,8 km',
    },

    {
      'nome': 'Carlos Lima',
      'servico': 'Passeio',
      'avaliacao': 4.8,
      'distancia': '1,2 km',
    },

    {
      'nome': 'Marina Alves',
      'servico': 'Hospedagem',
      'avaliacao': 4.7,
      'distancia': '1,5 km',
    },

    {
      'nome': 'João Santos',
      'servico': 'Banho e tosa',
      'avaliacao': 4.6,
      'distancia': '2,0 km',
    },

    {
      'nome': 'Beatriz Costa',
      'servico': 'Passeio e banho',
      'avaliacao': 4.9,
      'distancia': '2,3 km',
    },

    {
      'nome': 'Rafael Oliveira',
      'servico': 'Hospedagem e passeio',
      'avaliacao': 4.8,
      'distancia': '2,7 km',
    },
  ];

  // Abre a tela de detalhes
  void abrirDetalhes(Map<String, dynamic> cuidador) {

    Navigator.push(
      context,

      MaterialPageRoute(
        builder: (context) {

          return DetalhesCuidadorPage(
            cuidador: cuidador,
          );

        },
      ),
    );
  }

  // Mostra uma mensagem na parte inferior
  void mostrarMensagem(String mensagem) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // =====================================================
      // APP BAR
      // =====================================================

      appBar: AppBar(

        backgroundColor: AppBarStyles.corFundo,

        foregroundColor: AppBarStyles.corTexto,

        elevation: AppBarStyles.elevation,

        centerTitle: true,

        title: const Text(
          'AmigoPet',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        // Leading
        leading: Builder(
          builder: (context) {

            return IconButton(
              icon: const Icon(Icons.menu),

              onPressed: () {

                Scaffold.of(context).openDrawer();

              },
            );

          },
        ),

        // Actions
        actions: [

          PopupMenuButton<String>(

            onSelected: (valor) {

              mostrarMensagem(
                'Filtro selecionado: $valor',
              );

            },

            itemBuilder: (context) {

              return const [

                PopupMenuItem(
                  value: 'Mais próximos',
                  child: Text(
                    'Mais próximos',
                  ),
                ),

                PopupMenuItem(
                  value: 'Melhor avaliados',
                  child: Text(
                    'Melhor avaliados',
                  ),
                ),

              ];

            },
          ),

        ],
      ),

      // =====================================================
      // DRAWER
      // =====================================================

      drawer: Drawer(

        child: ListView(

          padding: EdgeInsets.zero,

          children: [

            // Cabeçalho do Drawer
            const DrawerHeader(

              decoration: BoxDecoration(
                color: AppBarStyles.corFundo,
              ),

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  CircleAvatar(

                    radius: 30,

                    backgroundColor:
                    Colors.white,

                    child: Icon(
                      Icons.pets,
                      size: 36,
                      color:
                      AppBarStyles.corFundo,
                    ),
                  ),

                  SizedBox(height: 12),

                  Text(
                    'AmigoPet',

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                ],
              ),
            ),

            // Cuidadores
            ListTile(

              leading: const Icon(
                Icons.pets,
              ),

              title: const Text(
                'Cuidadores',
              ),

              onTap: () {

                Navigator.pop(context);

              },
            ),

            // Meus agendamentos
            ListTile(

              leading: const Icon(
                Icons.calendar_month,
              ),

              title: const Text(
                'Meus agendamentos',
              ),

              onTap: () {

                Navigator.pop(context);

                mostrarMensagem(
                  'Meus agendamentos',
                );

              },
            ),

            // Configurações
            ListTile(

              leading: const Icon(
                Icons.settings,
              ),

              title: const Text(
                'Configurações',
              ),

              onTap: () {

                Navigator.pop(context);

                mostrarMensagem(
                  'Configurações',
                );

              },
            ),
          ],
        ),
      ),

      // =====================================================
      // LISTA DE CUIDADORES
      // =====================================================

      body: ListView.builder(

        padding: const EdgeInsets.all(12),

        itemCount: cuidadores.length,

        itemBuilder: (context, index) {

          final cuidador =
          cuidadores[index];

          return Card(

            margin: const EdgeInsets.only(
              bottom: 12,
            ),

            elevation: 2,

            child: ListTile(

              contentPadding:
              const EdgeInsets.all(12),

              // Foto/ícone
              leading: CircleAvatar(

                radius: 28,

                backgroundColor:
                Colors.green.shade100,

                child: const Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.green,
                ),
              ),

              // Nome
              title: Text(

                cuidador['nome'],

                style: const TextStyle(
                  fontWeight:
                  FontWeight.bold,
                  fontSize: 17,
                ),
              ),

              // Informações
              subtitle: Padding(

                padding:
                const EdgeInsets.only(
                  top: 6,
                ),

                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      cuidador['servico'],
                    ),

                    const SizedBox(
                      height: 6,
                    ),

                    Row(

                      children: [

                        const Icon(
                          Icons.star,
                          size: 17,
                          color: Colors.amber,
                        ),

                        const SizedBox(
                          width: 4,
                        ),

                        Text(
                          '${cuidador['avaliacao']}',
                        ),

                        const SizedBox(
                          width: 14,
                        ),

                        const Icon(
                          Icons.location_on,
                          size: 17,
                          color: Colors.green,
                        ),

                        const SizedBox(
                          width: 4,
                        ),

                        Text(
                          cuidador['distancia'],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              trailing: const Icon(
                Icons.chevron_right,
              ),

              // Ao tocar no cuidador
              onTap: () {

                abrirDetalhes(
                  cuidador,
                );

              },
            ),
          );
        },
      ),
    );
  }
}