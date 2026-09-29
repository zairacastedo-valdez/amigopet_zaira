import 'package:flutter/material.dart';

import '../styles/appbar_styles.dart';

class DetalhesCuidadorPage extends StatelessWidget {

  final Map<String, dynamic> cuidador;

  const DetalhesCuidadorPage({
    super.key,
    required this.cuidador,
  });

  // =====================================================
  // ALERT DIALOG
  // =====================================================

  void cancelarAgendamento(
      BuildContext context) {

    showDialog(

      context: context,

      builder: (dialogContext) {

        return AlertDialog(

          title: const Text(
            'Cancelar agendamento',
          ),

          content: const Text(
            'Tem certeza de que deseja cancelar '
                'este agendamento?',
          ),

          actions: [

            // Botão NÃO
            TextButton(

              onPressed: () {

                Navigator.pop(
                  dialogContext,
                );

              },

              child: const Text(
                'Não',
              ),
            ),

            // Botão SIM
            FilledButton(

              onPressed: () {

                Navigator.pop(
                  dialogContext,
                );

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(

                  const SnackBar(
                    content: Text(
                      'Agendamento cancelado.',
                    ),
                  ),
                );
              },

              child: const Text(
                'Sim, cancelar',
              ),
            ),
          ],
        );
      },
    );
  }

  // =====================================================
  // SIMPLE DIALOG
  // =====================================================

  void mostrarTipoServico(
      BuildContext context) {

    showDialog<String>(

      context: context,

      builder: (dialogContext) {

        return SimpleDialog(

          title: const Text(
            'Tipo de serviço',
          ),

          children: [

            // Passeio
            SimpleDialogOption(

              onPressed: () {

                Navigator.pop(
                  dialogContext,
                  'Passeio',
                );

              },

              child: const Text(
                'Passeio',
              ),
            ),

            // Hospedagem
            SimpleDialogOption(

              onPressed: () {

                Navigator.pop(
                  dialogContext,
                  'Hospedagem',
                );

              },

              child: const Text(
                'Hospedagem',
              ),
            ),

            // Banho e tosa
            SimpleDialogOption(

              onPressed: () {

                Navigator.pop(
                  dialogContext,
                  'Banho e tosa',
                );

              },

              child: const Text(
                'Banho e tosa',
              ),
            ),
          ],
        );
      },

    ).then((valor) {

      if (valor != null &&
          context.mounted) {

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(

          SnackBar(
            content: Text(
              'Serviço selecionado: $valor',
            ),
          ),
        );
      }
    });
  }

  // =====================================================
  // BOTTOM SHEET
  // =====================================================

  void mostrarMaisOpcoes(
      BuildContext context) {

    showModalBottomSheet(

      context: context,

      builder: (sheetContext) {

        return SafeArea(

          child: Wrap(

            children: [

              // Compartilhar
              ListTile(

                leading: const Icon(
                  Icons.share,
                ),

                title: const Text(
                  'Compartilhar perfil',
                ),

                onTap: () {

                  Navigator.pop(
                    sheetContext,
                  );

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(

                    const SnackBar(
                      content: Text(
                        'Perfil pronto para compartilhar.',
                      ),
                    ),
                  );
                },
              ),

              // Denunciar
              ListTile(

                leading: const Icon(
                  Icons.flag_outlined,
                ),

                title: const Text(
                  'Denunciar',
                ),

                onTap: () {

                  Navigator.pop(
                    sheetContext,
                  );

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(

                    const SnackBar(
                      content: Text(
                        'Denúncia selecionada.',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final String nome =
    cuidador['nome'];

    final String servico =
    cuidador['servico'];

    final double avaliacao =
    cuidador['avaliacao'];

    final String distancia =
    cuidador['distancia'];

    return Scaffold(

      // =====================================================
      // APP BAR
      // =====================================================

      appBar: AppBar(

        backgroundColor:
        AppBarStyles.corFundo,

        foregroundColor:
        AppBarStyles.corTexto,

        elevation:
        AppBarStyles.elevation,

        centerTitle: true,

        title: const Text(

          'Detalhes do cuidador',

          style: TextStyle(
            fontWeight:
            FontWeight.bold,
          ),
        ),

        // Botão voltar
        leading: IconButton(

          icon: const Icon(
            Icons.arrow_back,
          ),

          onPressed: () {

            Navigator.pop(
              context,
            );

          },
        ),

        // Mais opções
        actions: [

          IconButton(

            icon: const Icon(
              Icons.more_vert,
            ),

            onPressed: () {

              mostrarMaisOpcoes(
                context,
              );

            },
          ),
        ],
      ),

      // =====================================================
      // CONTEÚDO
      // =====================================================

      body: SingleChildScrollView(

        padding:
        const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.stretch,

          children: [

            // Foto
            CircleAvatar(

              radius: 55,

              backgroundColor:
              Colors.green.shade100,

              child: const Icon(

                Icons.person,

                size: 58,

                color: Colors.green,
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            // Nome
            Text(

              nome,

              textAlign:
              TextAlign.center,

              style: const TextStyle(

                fontSize: 26,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 8,
            ),

            // Avaliação
            Row(

              mainAxisAlignment:
              MainAxisAlignment.center,

              children: [

                const Icon(

                  Icons.star,

                  color:
                  Colors.amber,
                ),

                const SizedBox(
                  width: 5,
                ),

                Text(
                  '$avaliacao',
                ),

                const SizedBox(
                  width: 15,
                ),

                const Icon(
                  Icons.location_on,
                  color: Colors.green,
                ),

                const SizedBox(
                  width: 4,
                ),

                Text(
                  distancia,
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            // =================================================
            // CARD SOBRE
            // =================================================

            Card(

              child: Padding(

                padding:
                const EdgeInsets.all(18),

                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    const Text(

                      'Sobre o cuidador',

                      style: TextStyle(

                        fontSize: 19,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Text(

                      '$nome oferece serviços '
                          'de cuidado para pets '
                          'na sua região.',
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Text(
                      'Serviços: $servico',
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    const Text(
                      'Cuidador disponível para '
                          'atender cães e gatos com '
                          'carinho e responsabilidade.',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            // =================================================
            // TIPO DE SERVIÇO
            // =================================================

            FilledButton.icon(

              onPressed: () {

                mostrarTipoServico(
                  context,
                );

              },

              icon: const Icon(
                Icons.pets,
              ),

              label: const Text(
                'Tipo de serviço',
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // =================================================
            // MAIS OPÇÕES
            // =================================================

            OutlinedButton.icon(

              onPressed: () {

                mostrarMaisOpcoes(
                  context,
                );

              },

              icon: const Icon(
                Icons.more_horiz,
              ),

              label: const Text(
                'Mais opções',
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // =================================================
            // CANCELAR AGENDAMENTO
            // =================================================

            TextButton(

              onPressed: () {

                cancelarAgendamento(
                  context,
                );

              },

              child: const Text(

                'Cancelar agendamento',

                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}