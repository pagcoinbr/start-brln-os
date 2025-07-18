# Define o diretório de instalação como /root
INSTALL_DIR="/root/brln-os"

# Clone repository if it doesn't exist
if [[ ! -d "$INSTALL_DIR" ]]; then
  echo "Clonando repositório BRLN-OS..."
  if git clone https://github.com/pagcoinbr/brln-os.git "$INSTALL_DIR" 2>&1; then
    echo "Repositório clonado com sucesso."
    sudo -u root bash /root/brln-os/run.sh
  else
    echo "Erro ao clonar o repositório BRLN-OS."
    exit 1
  fi
fi

# Verificar se estamos no diretório correto
if [[ ! -d "container" ]]; then
    error "Diretório 'container' não encontrado!"
    error "Execute este script no diretório raiz do projeto brlnfullauto"
    echo ""
    echo "Exemplo:"
    echo "  git clone https://github.com/pagcoinbr/brln-os.git"
    echo "  cd brln-os"
    echo "  ./run.sh"
    exit 1
fi
