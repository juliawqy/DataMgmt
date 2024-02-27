USE sp_tr_lab;

DELIMITER $$
CREATE PROCEDURE sp_count_accounts (IN custname VARCHAR(45), OUT numsa INT, OUT numfda INT)
	BEGIN
		SELECT COUNT(*) INTO numsa FROM account WHERE custname=cus_name AND acc_type="SA";
        SELECT COUNT(*) INTO numfda FROM account WHERE custname=cus_name AND acc_type="FD";
    END$$
DELIMITER ;
CALL sp_count_accounts ("Alex", @SA, @FD);
SELECT @SA as "Savings", @FD as "Fixed Deposits";

SELECT * FROM transactions;

DELIMITER $$
CREATE TRIGGER update_amount
	AFTER INSERT ON transactions FOR EACH ROW
    BEGIN
		DECLARE old_amt DECIMAL (10,2);
		SET old_amt = (SELECT balance FROM account a WHERE a.acc_num=NEW.acc_num);
        IF NEW.trans_type = "D" THEN
			UPDATE account a SET a.balance = old_amt + NEW.amount WHERE a.acc_num=NEW.acc_num;
        ELSEIF NEW.trans_type = "W" THEN
			UPDATE account a SET a.balance = old_amt - NEW.amount WHERE a.acc_num=NEW.acc_num;
        END IF;
	END$$
DELIMITER ;

SELECT * FROM account;

INSERT INTO transactions (ACC_NUM, AMOUNT, TRANS_TYPE) VALUES ("A9", 200, "D");
SELECT * FROM account;

INSERT INTO transactions (ACC_NUM, AMOUNT, TRANS_TYPE) VALUES ("A9", 100, "W");
SELECT * FROM account;

#DROP TRIGGER update_amount;

DELIMITER $$
CREATE TRIGGER delete_acc
	BEFORE DELETE ON account FOR EACH ROW
	BEGIN
		INSERT INTO deleted_accounts VALUES (OLD.acc_num, OLD.acc_type, OLD.cus_name, OLD.balance, CURRENT_TIMESTAMP);
        DELETE FROM transactions WHERE acc_num = OLD.acc_num;
	END$$
DELIMITER ;

#DROP TRIGGER delete_acc;

SELECT * FROM account;
SELECT * FROM transactions;

INSERT INTO account VALUES ("ZZ", "FD", "DUMMY", 200);
SELECT * FROM account;

INSERT INTO transactions (acc_num, amount, trans_type) VALUES ("ZZ", 888.88, "D");
SELECT * FROM transactions;

INSERT INTO transactions (ACC_NUM, AMOUNT, TRANS_TYPE) VALUES ("ZZ", 200, "D");
SELECT * FROM account;

DELETE FROM account WHERE acc_num = "ZZ";
SELECT * FROM account;
SELECT * FROM transactions;
SELECT * FROM deleted_accounts;
			