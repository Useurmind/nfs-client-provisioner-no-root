FROM quay.io/external_storage/nfs-client-provisioner:v3.1.0-k8s1.11

# ARG USER=default
ARG UID=999
ARG GID=999
# ENV HOME /home/$USER

# install sudo as root
# RUN apk add --update sudo

# # add new user
# RUN adduser -D $USER -u $UID $GID\
#         && echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
#         && chmod 0440 /etc/sudoers.d/$USER

USER $UID:$GID
# WORKDIR $HOME

# files in /home/$USER to be owned by $USER
# docker has --chown flag for COPY, but it does not expand ENV so we fallback to:
# COPY src src
# RUN sudo chown -R $USER:$USER $HOME

# CMD echo "User $(whoami) running from $PWD with premissions: $(sudo -l)"