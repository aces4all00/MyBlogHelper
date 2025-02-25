function Get-BlogDate {
    [CmdletBinding(
        ConfirmImpact = 'None' 
    )]
    [OutputType([string])]
    param (
        [datetime]
        $Date = [datetime]::UtcNow,

        [ValidateSet(
            'Full',
            'OnlyDate',
            'OnlyTime'
        )]
        [string]
        $Mode = 'full'
    )
    $dtmFormat = if ($Mode -eq 'Full') {
        'yyyy-MM-dd HH:mm zzz'
    } elseif ($Mode -eq 'OnlyDate') {
        'yyyy-MM-dd'
    } elseif ($Mode -eq 'OnlyTime') {
        'HH:mm'
    } else {$null}
    $tzOffsetReplace = @(
        '([-+])(\d{2})\:(\d{2})$'
        '$1$2$3'
    )
    return $Date.ToString($dtmFormat) -replace $tzOffsetReplace
}
