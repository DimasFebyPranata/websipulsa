<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
  <!-- Brand Logo -->
  <a href="<?php echo site_url('') ?>" class="brand-link text-center">
    <span class="brand-text font-weight-light"><?php echo $this->session->userdata('toko')->nama ?></span>
  </a>
  <?php $uri = $this->uri->segment(1) ?>
  <?php $role = $this->session->userdata('role'); ?>

  <!-- Sidebar -->
  <div class="sidebar">

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <!-- Add icons to the links using the .nav-icon class
             with font-awesome or any other icon font library -->
        <li class="nav-item">
          <a href="<?php echo site_url('dashboard') ?>" class="nav-link <?php echo $uri == 'dashboard' || $uri == '' ? 'active' : 'no' ?>">
            <i class="nav-icon fas fa-tachometer-alt"></i>
            <p>
              Dashboard
            </p>
          </a>
        </li>
        
		<?php if ($role === 'admin'): ?>
        <li class="nav-item has-treeview <?php echo $uri == 'produk' || $uri == 'provider_produk' || $uri == 'pulsa_produk' ? 'menu-open' : 'no' ?>">
          <a href="#" class="nav-link <?php echo $uri == 'produk' || $uri == 'provider_produk' || $uri == 'pulsa_produk' ? 'active' : 'no' ?>">
            <i class="nav-icon fas fa-box"></i>
            <p>
              Produk
            </p>
            <i class="right fas fa-angle-right"></i>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?php echo site_url('provider_produk') ?>" class="nav-link <?php echo $uri == 'provider_produk' ? 'active' : 'no' ?>">
                <i class="far fa-circle nav-icon"></i>
                <p>
                  Provider Produk
                </p>
              </a>
            </li>
            <li class="nav-item">
              <a href="<?php echo site_url('pulsa_produk') ?>" class="nav-link <?php echo $uri == 'pulsa_produk' ? 'active' : 'no' ?>">
                <i class="far fa-circle nav-icon"></i>
                <p>
                  Pulsa Produk
                </p>
              </a>
            </li>
            <li class="nav-item">
              <a href="<?php echo site_url('produk') ?>" class="nav-link <?php echo $uri == 'produk' ? 'active' : 'no' ?>">
                <i class="far fa-circle nav-icon"></i>
                <p>
                  Produk
                </p>
              </a>
            </li>
          </ul>
        </li>
		<?php endif ?>
        
        <li class="nav-item">
          <a href="<?php echo site_url('transaksi') ?>" class="nav-link <?php echo $uri == 'transaksi' ? 'active' : 'no' ?>">
            <i class="fas fa-money-bill nav-icon"></i>
            <p>Transaksi</p>
          </a>
        </li>
		
		
		<?php if ($role === 'admin'): ?>
		 <li class="nav-item">
            <a href="<?php echo site_url('laporan_penjualan') ?>" class="nav-link <?php echo $uri == 'laporan_penjualan' ? 'active' : 'no' ?>">
              <i class="fas fa-book nav-icon"></i>
              <p>Laporan</p>
            </a>
          </li>
		  <?php endif ?>
		  
		
				 <?php if ($role === 'admin'): ?>
			<li class="nav-item">
            <a href="<?php echo site_url('pengguna') ?>" class="nav-link <?php echo $uri == 'pengguna' ? 'active' : 'no' ?>">
              <i class="fas fa-user nav-icon"></i>
              <p>User Management</p>
            </a>
          </li>
				 
          
        <?php endif ?>
		 
		

		
       
            
       
       
      </ul>
    </nav>
    <!-- /.sidebar-menu -->
  </div>
  <!-- /.sidebar -->
</aside>