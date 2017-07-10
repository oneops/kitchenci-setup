
.. image:: https://cdn.rawgit.com/sleepyorion/oneops-kitchen-setup/master/docs/images/bug.svg
    :height: 25px
    :alt: Bug Icon
    :align: left
ridley-v4.6.1_0.patch

Running kitchen in older version will produce harmless but uncessary noises such as the following messaages ::

  W, [2017-07-07T05:18:21.735782 #36214]  WARN -- : You are setting a key that conflicts with a built-in method Hashie::Mash#frozen? defined in Kernel. This can cause unexpected behavior when accessing the key via as a property. You can still access the key via the #[] method.
  W, [2017-07-07T05:18:21.735898 #36214]  WARN -- : You are setting a key that conflicts with a built-in method VariaModel::Attributes#frozen? defined in Kernel. This can cause unexpected behavior when accessing the key via as a property. You can still access the key via the #[] method.
  W, [2017-07-07T05:18:21.735954 #36214]  WARN -- : You are setting a key that conflicts with a built-in method VariaModel::Attributes#frozen? defined in Kernel. This can cause unexpected behavior when accessing the key via as a property. You can still access the key via the #[] method.
  W, [2017-07-07T05:18:21.738466 #36214]  WARN -- : You are setting a key that conflicts with a built-in method VariaModel::Attributes#default defined in Hash. This can cause unexpected behavior when accessing the key via as a property. You can still access the key via the #[] method.
  W, [2017-07-07T05:18:21.738521 #36214]  WARN -- : You are setting a key that conflicts with a built-in method VariaModel::Attributes#default defined in Hash. This can cause unexpected behavior when accessing the key via as a property. You can still access the key via the #[] method.


To suppress this message apply the patch for berksfile which has the following code changes::

    require "hashie"
    require "hashie/logger"
    Hashie.logger = Logger.new(nil)

.. image:: https://cdn.rawgit.com/sleepyorion/oneops-kitchen-setup/master/docs/images/bug.svg
    :height: 25px
    :alt: Bug Icon
    :align: left
test-kitchen-v1.16.0_0.patch
