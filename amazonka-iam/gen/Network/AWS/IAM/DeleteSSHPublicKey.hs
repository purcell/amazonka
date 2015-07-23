{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.IAM.DeleteSSHPublicKey
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Deletes the specified SSH public key.
--
-- The SSH public key deleted by this action is used only for
-- authenticating the associated IAM user to an AWS CodeCommit repository.
-- For more information about using SSH keys to authenticate to an AWS
-- CodeCommit repository, see
-- <http://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html Set up AWS CodeCommit for SSH Connections>
-- in the /AWS CodeCommit User Guide/.
--
-- <http://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteSSHPublicKey.html>
module Network.AWS.IAM.DeleteSSHPublicKey
    (
    -- * Request
      DeleteSSHPublicKey
    -- ** Request constructor
    , deleteSSHPublicKey
    -- ** Request lenses
    , dspkrqUserName
    , dspkrqSSHPublicKeyId

    -- * Response
    , DeleteSSHPublicKeyResponse
    -- ** Response constructor
    , deleteSSHPublicKeyResponse
    ) where

import           Network.AWS.IAM.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'deleteSSHPublicKey' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dspkrqUserName'
--
-- * 'dspkrqSSHPublicKeyId'
data DeleteSSHPublicKey = DeleteSSHPublicKey'
    { _dspkrqUserName       :: !Text
    , _dspkrqSSHPublicKeyId :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteSSHPublicKey' smart constructor.
deleteSSHPublicKey :: Text -> Text -> DeleteSSHPublicKey
deleteSSHPublicKey pUserName_ pSSHPublicKeyId_ =
    DeleteSSHPublicKey'
    { _dspkrqUserName = pUserName_
    , _dspkrqSSHPublicKeyId = pSSHPublicKeyId_
    }

-- | The name of the IAM user associated with the SSH public key.
dspkrqUserName :: Lens' DeleteSSHPublicKey Text
dspkrqUserName = lens _dspkrqUserName (\ s a -> s{_dspkrqUserName = a});

-- | The unique identifier for the SSH public key.
dspkrqSSHPublicKeyId :: Lens' DeleteSSHPublicKey Text
dspkrqSSHPublicKeyId = lens _dspkrqSSHPublicKeyId (\ s a -> s{_dspkrqSSHPublicKeyId = a});

instance AWSRequest DeleteSSHPublicKey where
        type Sv DeleteSSHPublicKey = IAM
        type Rs DeleteSSHPublicKey =
             DeleteSSHPublicKeyResponse
        request = post
        response = receiveNull DeleteSSHPublicKeyResponse'

instance ToHeaders DeleteSSHPublicKey where
        toHeaders = const mempty

instance ToPath DeleteSSHPublicKey where
        toPath = const "/"

instance ToQuery DeleteSSHPublicKey where
        toQuery DeleteSSHPublicKey'{..}
          = mconcat
              ["Action" =: ("DeleteSSHPublicKey" :: ByteString),
               "Version" =: ("2010-05-08" :: ByteString),
               "UserName" =: _dspkrqUserName,
               "SSHPublicKeyId" =: _dspkrqSSHPublicKeyId]

-- | /See:/ 'deleteSSHPublicKeyResponse' smart constructor.
data DeleteSSHPublicKeyResponse =
    DeleteSSHPublicKeyResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteSSHPublicKeyResponse' smart constructor.
deleteSSHPublicKeyResponse :: DeleteSSHPublicKeyResponse
deleteSSHPublicKeyResponse = DeleteSSHPublicKeyResponse'