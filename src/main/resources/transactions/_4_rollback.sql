
CREATE TABLE IF NOT EXISTS accounts (
      id BIGSERIAL PRIMARY KEY,
      name VARCHAR(128) UNIQUE,
      balance INTEGER
);

INSERT INTO accounts (name, balance) VALUES
      ('One', 1000),
      ('Two', 1000),
      ('Three', 1000);

 -- Change balance for user id = 1 and 2
            -- Start the transaction
DO $$
      BEGIN-- PostgreSQL anonymous code block
            --SAVEPOINT start_transaction;
            UPDATE accounts SET balance = balance - 100 WHERE id = 1;
            IF NOT FOUND THEN
                  --RAISE 'Account 1 not found';
                  --ROLLBACK TO start_transaction;
            END IF;

            BEGIN

                  UPDATE accounts SET balance = balance - 100 WHERE id = 4;
                  IF NOT FOUND THEN
                        --RAISE 'Account 2 not found';
                        --ROLLBACK TO start_transaction;
                  END IF;
            END;
      COMMIT;
      END;
$$;

ABORT TRANSACTION ;

SELECT * FROM accounts;

