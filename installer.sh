name_repo="ubuntu-fresh-install"

sudo apt install git

cd "/home/$USER/Downloads"
rm -r -f $name_repo

# use https for cloning (ssh doesnt work)
git clone "https://github.com/msperlin/$name_repo.git"

cd $name_repo

bash setup-with-whiptail.sh

