###

- git update-index --chmod=+x ./src/*.sh



git checkout main                     # Passez à la branche principale
git pull origin main                  # Mettez à jour la branche principale
git add .                             # Ajoutez les modifications (si nécessaire)
git commit -m "Préparation de la release vX.Y.Z"  # Commitez les modifications (si nécessaire)
git tag -a release-v1.0.0 -m "Release version 1.0.0"  # Créez un tag annoté pour la release
git push origin release-v1.0.0        # Poussez le tag sur GitHub
git push origin main                  # (Optionnel) Poussez la branche principale



git tag -d release-v1.0.0              # supprimez le tag release local
git push origin :refs/tags/release-v1.0.0 # supprimez le tag release distant 
git tag -a release-v1.0.0 -m "Release version 1.0.0" # recrez le tag










- echo -e  [server]"\n"$ANSIBLE_HOST ansible_host=37.187.73.64>ansible/hosts
- printf "[server]\n%s ansible_host=%s ansible_ssh_extra_args='-o StrictHostKeyChecking=no'\n" "${{ secrets.ANSIBLE_HOST }}" "${{ secrets.ANSIBLE_HOST }}" > ansible/hosts.ini



- ssh -i ../key-github-private-cloud2  -l github_ansible_lamanu cloud.stock.eu.org  -o StrictHostKeyChecking=no




GH_USER=REPLACE_WITH_USER \
GH_REPO=REPLACE_WITH_REPO \
GH_BRANCH=REPLACE_WITH_BRANCH \
wget https://github.com/${GH_USER}/${GH_REPO}/archive/refs/tags/${GH_BRANCH}.zip \
-O "${GH_REPO}-${GH_BRANCH}.zip" && \ 
unzip ./"${GH_REPO}-${GH_BRANCH}.zip" && \
rm ./"${GH_REPO}-${GH_BRANCH}.zip"


GH_USER=REPLACE_WITH_USER \
GH_REPO=REPLACE_WITH_REPO \
GH_BRANCH=REPLACE_WITH_BRANCH \
wget https://github.com/${GH_USER}/${GH_REPO}/archive/refs/tags/${GH_BRANCH}.tar.gz \
-O "${GH_REPO}-${GH_BRANCH}.tar.gz" && \
tar -xzvf ./"${GH_REPO}-${GH_BRANCH}.tar.gz" && \
rm ./"${GH_REPO}-${GH_BRANCH}.tar.gz"
