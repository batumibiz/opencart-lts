<?php

namespace Opencart\Admin\Model\Tool;

use Opencart\System\Engine\Model;
use Opencart\System\Library\Svg;

class Image extends Model {
	public function resize(string $filename, int $width, int $height): string {
		$filename = html_entity_decode($filename, ENT_QUOTES, 'UTF-8');

		if (!is_file(DIR_IMAGE . $filename) || substr(str_replace('\\', '/', realpath(DIR_IMAGE . $filename)), 0, strlen(DIR_IMAGE)) != DIR_IMAGE) {
			return '';
		}

		$extension = pathinfo($filename, PATHINFO_EXTENSION);

		$image_old = $filename;
		$image_new = 'cache/' . oc_substr($filename, 0, oc_strrpos($filename, '.')) . '-' . $width . 'x' . $height . '.' . $extension;

		if (!is_file(DIR_IMAGE . $image_new) || (filemtime(DIR_IMAGE . $image_old) > filemtime(DIR_IMAGE . $image_new))) {
			if ($extension == 'svg') {
				$this->makeDir(DIR_IMAGE . dirname($image_new));
				file_put_contents(DIR_IMAGE . $image_new, Svg::resize(DIR_IMAGE . $filename, $width, $height));

				return HTTP_CATALOG . 'image/' . $image_new;
			}

			$info = getimagesize(DIR_IMAGE . $image_old);

			if ($info === false) {
				return '';
			}

			[$width_orig, $height_orig, $image_type] = $info;

			if (!in_array($image_type, [IMAGETYPE_PNG, IMAGETYPE_JPEG, IMAGETYPE_GIF, IMAGETYPE_WEBP])) {
				return HTTP_CATALOG . 'image/' . $image_old;
			}

			$this->makeDir(DIR_IMAGE . dirname($image_new));

			if ($width_orig != $width || $height_orig != $height) {
				$image = new \Opencart\System\Library\Image(DIR_IMAGE . $image_old);
				$image->resize($width, $height);
				$image->save(DIR_IMAGE . $image_new);
			} else {
				copy(DIR_IMAGE . $image_old, DIR_IMAGE . $image_new);
			}
		}

		return HTTP_CATALOG . 'image/' . $image_new;
	}

	private function makeDir(string $path): void {
		if (!is_dir($path)) {
			@mkdir($path, 0777, true);
		}
	}
}
