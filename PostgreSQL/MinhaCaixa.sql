\connect postgres


-- Exclui banco se existir

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM pg_database WHERE datname = 'minha_caixa') THEN
    ALTER DATABASE minha_caixa CONNECTION LIMIT 0;
    PERFORM pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'minha_caixa' AND pid != pg_backend_pid();
  END IF;
END; $$;
DROP DATABASE IF EXISTS minha_caixa;
