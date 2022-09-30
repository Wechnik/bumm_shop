<?php
class ModelSmartFilterSmartFilter extends Model {
    public function addDiskiOtv($data) {
        $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_diski_otv` SET diski_otv = '" . $this->db->escape($data['diski_otv']) . "', diski_sort = '" . (int)$data['diski_sort'] . "'");

        $car_year_id = $this->db->getLastId();

        return $car_year_id;
    }

    public function editDiskiOtv($car_year_id, $data) {
        $this->db->query("UPDATE `" . DB_PREFIX . "sf_diski_otv` SET diski_otv = '" . $this->db->escape($data['diski_otv']) . "', diski_sort = '" . (int)$data['diski_sort'] . "' WHERE id = '" . (int)$car_year_id . "'");
    }

    public function deleteDiskiOtv($car_year_id) {
        $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_diski_otv` WHERE id = '" . (int)$car_year_id . "'");
    }

    public function getDiskiOtv($car_year_id) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_diski_otv` WHERE id = '" . (int)$car_year_id . "'");

        return $query->row;
    }

    public function getsDiskiOtv($data = array()) {
        $sql = "SELECT * FROM `" . DB_PREFIX . "sf_diski_otv` ";

        $sort_data = array(
            'diski_otv',
            'diski_sort'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY diski_otv";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }


    public function getTotalDiskiOtv() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "sf_diski_otv`");

        return $query->row['total'];
    }

    public function addDiskiDiametr($data) {
        $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_diski_diametr` SET diski_diametr = '" . $this->db->escape($data['diski_diametr']) . "', diski_sort = '" . (int)$data['diski_sort'] . "'");

        $diski_diametr_id = $this->db->getLastId();
        if(isset($data['otv_to_diametr']) && is_array($data['otv_to_diametr'])) {

            foreach ($data['otv_to_diametr'] as $otv_to_diametr) {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_otv_to_diametr` SET otv_id = '" . (int)$otv_to_diametr . "', diametr_id = '" . (int)$diski_diametr_id . "'");
            }

        }

        return $car_year_id;
    }

    public function editDiskiDiametr($car_year_id, $data) {
        $this->db->query("UPDATE `" . DB_PREFIX . "sf_diski_diametr` SET diski_diametr = '" . $this->db->escape($data['diski_diametr']) . "', diski_sort = '" . (int)$data['diski_sort'] . "' WHERE id = '" . (int)$car_year_id . "'");
      $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_otv_to_diametr` WHERE diametr_id = '" . (int)$car_year_id . "'");
      if(isset($data['otv_to_diametr']) && is_array($data['otv_to_diametr'])) {

            foreach ($data['otv_to_diametr'] as $otv_to_diametr) {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_otv_to_diametr` SET otv_id = '" . (int)$otv_to_diametr . "', diametr_id = '" . (int)$car_year_id . "'");
            }

        }

 }

    public function deleteDiskiDiametr($car_year_id) {
        $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_diski_diametr` WHERE id = '" . (int)$car_year_id . "'");
        $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_otv_to_diametr` WHERE diametr_id = '" . (int)$car_year_id . "'");
    }

    public function getDiskiDiametr($car_year_id) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_diski_diametr` WHERE id = '" . (int)$car_year_id . "'");

        return $query->row;
    }

    public function getsDiskiDiametr($data = array()) {
        $sql = "SELECT * FROM `" . DB_PREFIX . "sf_diski_diametr` ";

        $sort_data = array(
            'diski_diametr',
            'diski_sort'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY diski_diametr";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }


    public function getTotalDiskiDiametr() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "sf_diski_diametr`");

        return $query->row['total'];
    }

    public function addDiskiWidth($data) {
        $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_diski_width` SET diski_width = '" . $this->db->escape($data['diski_width']) . "', diski_sort = '" . (int)$data['diski_sort'] . "'");

        $diski_width_id = $this->db->getLastId();
        if(isset($data['diametr_to_width']) && is_array($data['diametr_to_width'])) {

            foreach ($data['diametr_to_width'] as $diametr_to_width) {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_diametr_to_width` SET diamet_id = '" . (int)$diametr_to_width . "', width_id = '" . (int)$diski_width_id . "'");
            }

        }

        return $diski_width_id;
    }

    public function editDiskiWidth($diski_width_id, $data) {
        $this->db->query("UPDATE `" . DB_PREFIX . "sf_diski_width` SET diski_width = '" . $this->db->escape($data['diski_width']) . "', diski_sort = '" . (int)$data['diski_sort'] . "' WHERE id = '" . (int)$diski_width_id . "'");
     $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_diametr_to_width` WHERE width_id = '" . (int)$diski_width_id . "'");
      if(isset($data['diametr_to_width']) && is_array($data['diametr_to_width'])) {

            foreach ($data['diametr_to_width'] as $diametr_to_width) {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_diametr_to_width` SET diamet_id = '" . (int)$diametr_to_width . "', width_id = '" . (int)$diski_width_id . "'");
            }

        }
  }

    public function deleteDiskiWidth($diski_width_id) {
        $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_diski_width` WHERE id = '" . (int)$diski_width_id . "'");
        $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_diametr_to_width` WHERE width_id = '" . (int)$diski_width_id . "'");
    }

    public function getDiskiWidth($diski_width_id) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_diski_width` WHERE id = '" . (int)$diski_width_id . "'");

        return $query->row;
    }

    public function getsDiskiWidth($data = array()) {
        $sql = "SELECT * FROM `" . DB_PREFIX . "sf_diski_width` ";

        $sort_data = array(
            'diski_width',
            'diski_sort'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY diski_width";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }


    public function getTotalDiskiWidth() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "sf_diski_width`");

        return $query->row['total'];
    }

    public function addDiskiDia($data) {
        $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_diski_dia` SET diski_dia = '" . $this->db->escape($data['diski_dia']) . "', diski_sort = '" . (int)$data['diski_sort'] . "'");

        $diski_dia_id = $this->db->getLastId();
        if(isset($data['vilet_to_dia']) && is_array($data['vilet_to_dia'])) {

            foreach ($data['vilet_to_dia'] as $vilet_to_dia) {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_vilet_to_dia` SET vilet_id = '" . (int)$vilet_to_dia . "', dia_id = '" . (int)$diski_dia_id . "'");
            }

        }
        return $car_year_id;
    }

    public function editDiskiDia($diski_dia_id, $data) {
        $this->db->query("UPDATE `" . DB_PREFIX . "sf_diski_dia` SET diski_dia = '" . $this->db->escape($data['diski_dia']) . "', diski_sort = '" . (int)$data['diski_sort'] . "' WHERE id = '" . (int)$diski_dia_id . "'");
      $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_vilet_to_dia` WHERE dia_id = '" . (int)$diski_dia_id . "'");
      if(isset($data['vilet_to_dia']) && is_array($data['vilet_to_dia'])) {

            foreach ($data['vilet_to_dia'] as $vilet_to_dia) {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_vilet_to_dia` SET vilet_id = '" . (int)$vilet_to_dia . "', dia_id = '" . (int)$diski_dia_id . "'");
            }

        }
  }

    public function deleteDiskiDia($diski_dia_id) {
        $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_diski_dia` WHERE id = '" . (int)$diski_dia_id . "'");
        $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_vilet_to_dia` WHERE dia_id = '" . (int)$diski_dia_id . "'");
    }

    public function getDiskiDia($diski_dia_id) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_diski_dia` WHERE id = '" . (int)$diski_dia_id . "'");

        return $query->row;
    }

    public function getsDiskiDia($data = array()) {
        $sql = "SELECT * FROM `" . DB_PREFIX . "sf_diski_dia` ";

        $sort_data = array(
            'diski_dia',
            'diski_sort'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY diski_dia";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }


    public function getTotalDiskiDia() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "sf_diski_dia`");

        return $query->row['total'];
    }


    public function addDiskiVilet($data) {
        $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_diski_vilet` SET diski_vilet = '" . $this->db->escape($data['diski_vilet']) . "', diski_sort = '" . (int)$data['diski_sort'] . "'");

        $diski_vilet_id = $this->db->getLastId();
        if(isset($data['width_to_vilet']) && is_array($data['width_to_vilet'])) {

            foreach ($data['width_to_vilet'] as $width_to_vilet) {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_width_to_vilet` SET width_id = '" . (int)$width_to_vilet . "', vilet_id = '" . (int)$diski_vilet_id . "'");
            }

        }

        return $diski_vilet_id;
    }

    public function editDiskiVilet($diski_vilet_id, $data) {
        $this->db->query("UPDATE `" . DB_PREFIX . "sf_diski_vilet` SET diski_vilet = '" . $this->db->escape($data['diski_vilet']) . "', diski_sort = '" . (int)$data['diski_sort'] . "' WHERE id = '" . (int)$diski_vilet_id . "'");
        $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_width_to_vilet` WHERE vilet_id = '" . (int)$diski_vilet_id . "'");
    if(isset($data['width_to_vilet']) && is_array($data['width_to_vilet'])) {

            foreach ($data['width_to_vilet'] as $width_to_vilet) {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_width_to_vilet` SET width_id = '" . (int)$width_to_vilet . "', vilet_id = '" . (int)$diski_vilet_id . "'");
            }

        }
    }

    public function deleteDiskiVilet($diski_vilet_id) {
        $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_diski_vilet` WHERE id = '" . (int)$diski_vilet_id . "'");
        $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_sf_width_to_vilet` WHERE vilet_id = '" . (int)$diski_vilet_id . "'");
    }

    public function getDiskiVilet($car_year_id) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_diski_vilet` WHERE id = '" . (int)$car_year_id . "'");

        return $query->row;
    }

    public function getsDiskiVilet($data = array()) {
        $sql = "SELECT * FROM `" . DB_PREFIX . "sf_diski_vilet` ";

        $sort_data = array(
            'diski_vilet',
            'diski_sort'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY diski_vilet";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }


    public function getTotalDiskiVilet() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "sf_diski_vilet`");

        return $query->row['total'];
    }


    public function addShinaWidth($data) {
        $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_shina_width` SET shina_width = '" . $this->db->escape($data['shina_width']) . "', shina_sort = '" . (int)$data['shina_sort'] . "'");

        $shina_widtht_id = $this->db->getLastId();
        if(isset($data['shina_diametr_to_width']) && is_array($data['shina_diametr_to_width'])) {
            foreach ($data['shina_diametr_to_width'] as $shina_diametr_to_width) {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_shina_diametr_to_width` SET diametr_id = '" . (int)$shina_diametr_to_width . "', width_id = '" . (int)$shina_widtht_id . "'");
            }
        }
        return $shina_widtht_id;
    }

    public function editShinaWidth($shina_widtht_id, $data) {
      $this->db->query("UPDATE `" . DB_PREFIX . "sf_shina_width` SET shina_width = '" . $this->db->escape($data['shina_width']) . "', shina_sort = '" . (int)$data['shina_sort'] . "' WHERE id = '" . (int)$shina_widtht_id . "'");
      $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_shina_diametr_to_width` WHERE width_id = '" . (int)$shina_widtht_id . "'");
    if(isset($data['shina_diametr_to_width']) && is_array($data['shina_diametr_to_width'])) {
            foreach ($data['shina_diametr_to_width'] as $shina_diametr_to_width) {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_shina_diametr_to_width` SET diametr_id = '" . (int)$shina_diametr_to_width . "', width_id = '" . (int)$shina_widtht_id . "'");
            }
        }
   }

    public function deleteShinaWidth($shina_widtht_id) {
        $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_shina_width` WHERE id = '" . (int)$shina_widtht_id . "'");
        $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_shina_diametr_to_width` WHERE width_id = '" . (int)$shina_widtht_id . "'");
    }

    public function getShinaWidth($shina_widtht_id) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_shina_width` WHERE id = '" . (int)$shina_widtht_id . "'");

        return $query->row;
    }

    public function getsShinaWidth($data = array()) {
        $sql = "SELECT * FROM `" . DB_PREFIX . "sf_shina_width` ";

        $sort_data = array(
            'shina_width',
            'shina_sort'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY shina_width";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }


    public function getTotalShinaWidth() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "sf_shina_width`");

        return $query->row['total'];
    }

    public function addShinaDiametr($data) {
        $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_shina_diametr` SET shina_diametr = '" . $this->db->escape($data['shina_diametr']) . "', shina_sort = '" . (int)$data['shina_sort'] . "'");

        $car_year_id = $this->db->getLastId();

        return $car_year_id;
    }

    public function editShinaDiametr($car_year_id, $data) {
        $this->db->query("UPDATE `" . DB_PREFIX . "sf_shina_diametr` SET shina_diametr = '" . $this->db->escape($data['shina_diametr']) . "', shina_sort = '" . (int)$data['shina_sort'] . "' WHERE id = '" . (int)$car_year_id . "'");
    }

    public function deleteShinaDiametr($car_year_id) {
        $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_shina_diametr` WHERE id = '" . (int)$car_year_id . "'");
    }

    public function getShinaDiametr($car_year_id) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_shina_diametr` WHERE id = '" . (int)$car_year_id . "'");

        return $query->row;
    }

    public function getsShinaDiametr($data = array()) {
        $sql = "SELECT * FROM `" . DB_PREFIX . "sf_shina_diametr` ";

        $sort_data = array(
            'shina_diametr',
            'shina_sort'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY shina_diametr";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }


    public function getTotalShinaDiametr() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "sf_shina_diametr`");

        return $query->row['total'];
    }


    public function addShinaProfil($data) {
        $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_shina_profil` SET shina_profil = '" . $this->db->escape($data['shina_profil']) . "', shina_sort = '" . (int)$data['shina_sort'] . "'");

        $shina_profil_id = $this->db->getLastId();
        if(isset($data['shina_width_to_profil']) && is_array($data['shina_width_to_profil'])) {
            foreach ($data['shina_width_to_profil'] as $shina_width_to_profil) {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_shina_width_to_profil` SET width_id = '" . (int)$shina_width_to_profil . "', profil_id = '" . (int)$shina_profil_id . "'");
            }
        }
        return $shina_profil_id;
    }

    public function editShinaProfil($shina_profil_id, $data) {
        $this->db->query("UPDATE `" . DB_PREFIX . "sf_shina_profil` SET shina_profil = '" . $this->db->escape($data['shina_profil']) . "', shina_sort = '" . (int)$data['shina_sort'] . "' WHERE id = '" . (int)$shina_profil_id . "'");
       $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_shina_width_to_profil` WHERE profil_id = '" . (int)$shina_profil_id . "'");
    if(isset($data['shina_width_to_profil']) && is_array($data['shina_width_to_profil'])) {
            foreach ($data['shina_width_to_profil'] as $shina_width_to_profil) {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_shina_width_to_profil` SET width_id = '" . (int)$shina_width_to_profil . "', profil_id = '" . (int)$shina_profil_id . "'");
            }
        }
    }

    public function deleteShinaProfil($shina_profil_id) {
        $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_shina_profil` WHERE id = '" . (int)$shina_profil_id . "'");
        $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_shina_width_to_profil` WHERE profil_id = '" . (int)$shina_profil_id . "'");
    }

    public function getShinaProfil($shina_profil_id) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_shina_profil` WHERE id = '" . (int)$shina_profil_id . "'");

        return $query->row;
    }

    public function getsShinaProfil($data = array()) {
        $sql = "SELECT * FROM `" . DB_PREFIX . "sf_shina_profil` ";

        $sort_data = array(
            'shina_profil',
            'shina_sort'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY shina_profil";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }


    public function getTotalShinaProfil() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "sf_shina_profil`");

        return $query->row['total'];
    }

    public function getDiametrOtv($car_diametr_id) {

        $otv_diametr = [];

        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_otv_to_diametr` WHERE diametr_id = '" . (int)$car_diametr_id . "'");

        if($query->num_rows) {
            foreach ($query->rows as $diametr) {
                $otv_diametr[] = $diametr['otv_id'];
            }
        }

        return $otv_diametr;
    }

    public function getWidthDiametr($car_width_id) {

        $diametr_width = [];

        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_diametr_to_width` WHERE width_id = '" . (int)$car_width_id . "'");

        if($query->num_rows) {
            foreach ($query->rows as $width) {
                $diametr_width[] = $width['diamet_id'];
            }
        }

        return $diametr_width;
    }

    public function getViletWidth($car_vilet_id) {

        $width_vilet = [];

        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_width_to_vilet` WHERE vilet_id = '" . (int)$car_vilet_id . "'");

        if($query->num_rows) {
            foreach ($query->rows as $vilet) {
                $width_vilet[] = $vilet['width_id'];
            }
        }

        return $width_vilet;
    }

    public function getDiaVilet($car_dia_id) {

        $vilet_dia = [];

        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_vilet_to_dia` WHERE dia_id = '" . (int)$car_dia_id . "'");

        if($query->num_rows) {
            foreach ($query->rows as $dia) {
                $vilet_dia[] = $dia['vilet_id'];
            }
        }

        return $vilet_dia;
    }
    public function getShWidthDiametr($car_width_id) {

        $diametr_width = [];

        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_shina_diametr_to_width` WHERE width_id = '" . (int)$car_width_id . "'");

        if($query->num_rows) {
            foreach ($query->rows as $width) {
                $diametr_width[] = $width['diametr_id'];
            }
        }

        return $diametr_width;
    }

    public function getShProfilWidth($car_profil_id) {

        $width_profil = [];

        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_shina_width_to_profil` WHERE profil_id = '" . (int)$car_profil_id . "'");

        if($query->num_rows) {
            foreach ($query->rows as $profil) {
                $width_profil[] = $profil['width_id'];
            }
        }

        return $width_profil;
    }
}
