abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
    print('Deposited amount: $amount');
    print('New Balance: $balance');
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {

    balance -= amount;
    balance -= balance * interestRate;
    print('Withdraw amount: $amount');
    print('New Balance: $balance');
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= overdraftLimit) {
      print('Withdraw amount: $amount');
      balance -= amount;
      print('New Balance: $balance');
    } else {
      print('Insufficient funds');
    }
  }
}

void main() {
  var savingsAccount = SavingsAccount(96374, 5000.0, 0.05);
  savingsAccount.deposit(500.0);
  savingsAccount.withdraw(400.0);
  print('');


  var currentAccount = CurrentAccount(75394, 5000.0, 1000.0);
  currentAccount.deposit(400.0);
  currentAccount.withdraw(2000.0);
}
