-- Execute no Supabase SQL Editor somente depois de criar o primeiro usuário
-- em Authentication > Users. Substitua o UUID pelo ID do usuário criado.
-- Esta operação concede o perfil de administrador ao usuário escolhido.
update public.profiles
set role = 'admin',
    is_active = true,
    must_change_password = true,
    updated_at = now()
where id = 'COLE-AQUI-O-UUID-DO-ADMIN'::uuid;

-- Verifique o resultado: deve retornar role=admin e is_active=true.
select id, full_name, email, role, is_active, must_change_password
from public.profiles
where id = 'COLE-AQUI-O-UUID-DO-ADMIN'::uuid;
