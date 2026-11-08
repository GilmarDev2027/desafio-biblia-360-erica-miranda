# Desafio Ap. Erica Miranda - Bíblia 360 dias FULL

Aplicação web responsiva para acompanhamento individual de leitura bíblica em 360 dias.

## Arquitetura
- Frontend estático: GitHub Pages.
- Autenticação, PostgreSQL e funções: Supabase.
- Fuso horário do produto: America/Sao_Paulo.
- Não existe cadastro público. Usuários são criados por administrador.

## Endereços
- Repositório: https://github.com/GilmarDev2027/desafio-biblia-360-erica-miranda
- Supabase: https://ahepdhqyzyopjiuauyab.supabase.co
- Funções: login-gateway, admin-create-user e change-password.

## Publicação
O workflow em `.github/workflows/pages.yml` publica o conteúdo da raiz do repositório no GitHub Pages sempre que houver push na branch `main`.

No GitHub, confira em **Settings → Pages** se a fonte está definida como **GitHub Actions**. Depois de concluir o primeiro workflow, o endereço será:
https://gilmardev2027.github.io/desafio-biblia-360-erica-miranda/

## Configuração inicial obrigatória
1. No Supabase Dashboard, abra Authentication → Users e crie manualmente o primeiro usuário administrador com e-mail confirmado.
2. Copie o UUID desse usuário.
3. No SQL Editor, execute (substituindo o UUID):
   `update public.profiles set role='admin', is_active=true, must_change_password=true where id='UUID-DO-ADMIN';`
4. O administrador deve entrar com o e-mail e senha criados e trocar a senha no primeiro acesso.
5. Cadastre os participantes pelo painel e crie seus planos individuais.

**Importante:** não há senha padrão embutida. Não coloque chaves secretas ou service_role no GitHub. O frontend usa somente a chave publicável do Supabase. As funções administrativas usam os segredos internos do ambiente Supabase.

## Funcionalidades entregues nesta versão
- Login protegido por função de autenticação, com bloqueio de 5 tentativas por 15 minutos.
- Troca obrigatória de senha no primeiro acesso.
- Perfis de administrador e participante.
- Cadastro de participantes restrito ao administrador.
- Catálogo de 66 e 73 livros bíblicos com capítulos.
- Criação de plano individual com distribuição dos capítulos em 360 dias.
- Kanban individual: Programado, Planejado do dia e Lido.
- Histórico de conclusão e reprogramação.
- Redistribuição de pendências sem alterar capítulos concluídos.
- Exportação CSV e impressão do histórico.
- Tema claro/escuro e layout responsivo.

## Segurança
As tabelas do schema public têm RLS habilitado. Os dados de planos, capítulos e histórico são filtrados por usuário. As funções privilegiadas ficam no schema privado ou em Edge Functions. Nunca publicar a service_role/secret key.
