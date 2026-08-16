<?php

namespace Opencart\System\Library;

class Svg {
	public static function resize(string $filePath, int $newWidth, int $newHeight, bool $proportional = false): string {
		$xml = simplexml_load_file($filePath);

		if ($xml === false) {
			return '';
		}

		if (!isset($xml['viewBox'])) {
			$origWidth = preg_replace('/[^0-9.]/', '', (string)($xml['width'] ?? $newWidth));
			$origHeight = preg_replace('/[^0-9.]/', '', (string)($xml['height'] ?? $newHeight));

			$xml->addAttribute('viewBox', "0 0 {$origWidth} {$origHeight}");
		}

		if ($proportional) {
			[$x, $y, $vw, $vh] = explode(' ', preg_replace('/\s+/', ' ', trim($xml['viewBox'])));
			$aspectRatio = (int)$vw / (int)$vh;
			$newHeight = round($newWidth / $aspectRatio);
		}

		unset($xml['width'], $xml['height']);
		$xml->addAttribute('width', (string)$newWidth);
		$xml->addAttribute('height', (string)$newHeight);

		return $xml->asXML();
	}
}
